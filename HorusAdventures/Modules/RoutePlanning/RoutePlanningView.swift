//
//  RoutePlanningView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 25.09.2024.
//

import SwiftUI

enum ActiveTripAlert: Identifiable {
    case confirmation
    case notificationSetup
    
    var id: Int { self.hashValue }
}

struct TripPoint: Identifiable, Codable {
    let id: String
    let attractionName: String
    let date: Date
}

struct TripPlan: Identifiable, Codable {
    let id: String
    let tripPoints: [TripPoint]
}

struct RoutePlanningView: View {
    
    @StateObject private var notificationManager: NotificationManager = .shared
    
    @State private var selectedAttraction: Attraction? = nil
    @State private var selectedDate: Date = Date()
    @State private var currentTripPoints: [TripPoint] = []
    @State private var tripPlans: [TripPlan] = []
    @State private var showDatePicker = false
    @State private var activeAlert: ActiveTripAlert?
    @State private var showOtherTrips = false
    private var formatter = DateFormatter()
    
    var body: some View {
        VStack {
            Text("Plan Your Path!")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Create a personalized travel route to visit all the landmarks on your list. Whether you’re exploring Cairo or the far reaches of Upper Egypt, plan ahead for the ultimate Egyptian adventure.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack {
                Menu {
                    ForEach(attractions) { attraction in
                        Button(action: {
                            selectedAttraction = attraction
                        }) {
                            Text(attraction.name)
                        }
                    }
                } label: {
                    Text("Choose Place")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.yellow)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.yellow))
                }
                
                Button(action: {
                    showDatePicker.toggle()
                }) {
                    Text("Choose Date")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.yellow)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.yellow))
                }
            }
            .padding(.horizontal)
            
            if let selectedAttraction = selectedAttraction {
                HStack {
                    Image(name: selectedAttraction.baseImageName)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                    
                    VStack(alignment: .leading) {
                        Text(selectedAttraction.name)
                        Text("Date: \(selectedDate, formatter: formatter)")
                    }
                }
                .padding(.horizontal)
            }
            
            Button(action: addTripPoint) {
                HStack {
                    Image(systemName: "plus")
                    Text("Add This Stop")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.yellow)
                .padding()
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.yellow))
            }
            .padding(.horizontal)
            .opacity(selectedAttraction == nil ? 0.5 : 1)
            .disabled(selectedAttraction == nil)
            
            if !currentTripPoints.isEmpty {
                List {
                    ForEach(currentTripPoints) { tripPoint in
                        HStack {
                            Image(name: getAttractionImageName(attractionName: tripPoint.attractionName))
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                Text(tripPoint.attractionName)
                                Text("Date: \(tripPoint.date, formatter: formatter)")
                            }
                        }
                    }
                    .onDelete(perform: deleteTripPoint)
                }
                .frame(height: 200)
            }
            
            Button(action: {
                activeAlert = .confirmation
            }) {
                Text("CONFIRM")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.yellow)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.yellow))
            }
            .padding(.horizontal)
            .opacity(currentTripPoints.isEmpty ? 0.5 : 1)
            .disabled(currentTripPoints.isEmpty)
            
            Spacer()
            
            Button(action: {
                showOtherTrips.toggle()
            }) {
                Text("VIEW OTHER TRIPS")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.yellow))
            }
            .padding()
            .foregroundColor(.yellow)
            .sheet(isPresented: $showOtherTrips) {
                TripsView(tripPlans: $tripPlans)
            }
        }
        .sheet(isPresented: $showDatePicker) {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding()
                .presentationDetents([.height(300)])
        }
        .alert(item: $activeAlert) { alertType in
            switch alertType {
            case .confirmation:
                return Alert(
                    title: Text("Are you ready to confirm the trip?"),
                    primaryButton: .default(Text("OK"), action: confirmTrip),
                    secondaryButton: .cancel()
                )
            case .notificationSetup:
                return Alert(
                    title: Text("Reminder Setup"),
                    message: Text("Do you want to set up push notifications with a reminder about the trip?"),
                    primaryButton: .default(Text("Yes")) {
                        setupTripNotification()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        
        .onAppear {
            loadTripPlans()
        }
    }
    
    init() {
        formatter.dateStyle = .short
    }
    
    private func addTripPoint() {
        if let attraction = selectedAttraction {
            let newTripPoint = TripPoint(id: UUID().uuidString, attractionName: attraction.name, date: selectedDate)
            currentTripPoints.append(newTripPoint)
            selectedAttraction = nil
        }
    }
    
    private func deleteTripPoint(at offsets: IndexSet) {
        currentTripPoints.remove(atOffsets: offsets)
    }
    
    private func confirmTrip() {
        if !currentTripPoints.isEmpty {
            let newTripPlan = TripPlan(id: UUID().uuidString, tripPoints: currentTripPoints)
            tripPlans.append(newTripPlan)
            saveTripPlans()
            currentTripPoints = []
            activeAlert = .notificationSetup
        }
    }
    
    private func setupTripNotification() {
        Task {
            await notificationManager.requestAuthorization()
            notificationManager.areNotificationsOn = true
            
            for tripPoint in currentTripPoints {
                let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: tripPoint.date)
                notificationManager.scheduleNotification(
                    title: "Upcoming Trip",
                    body: "Don't forget your trip to \(tripPoint.attractionName) today!",
                    date: components
                )
            }
        }
    }
    
    private func saveTripPlans() {
        if let encoded = try? JSONEncoder().encode(tripPlans) {
            UserDefaults.standard.set(encoded, forKey: "TripPlans")
        }
    }
    
    private func loadTripPlans() {
        if let data = UserDefaults.standard.data(forKey: "TripPlans"),
           let decoded = try? JSONDecoder().decode([TripPlan].self, from: data) {
            tripPlans = decoded
        }
    }
    
    private func getAttractionImageName(attractionName: String) -> String {
        if let attraction = attractions.first(where: {$0.name == attractionName}) {
            return attraction.baseImageName
        }
        
        return "templeImg"
    }
}

#Preview {
    RoutePlanningView()
}
