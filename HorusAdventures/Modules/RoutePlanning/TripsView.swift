//
//  TripsView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 26.09.2024.
//

import SwiftUI

struct TripsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Binding var tripPlans: [TripPlan]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tripPlans) { tripPlan in
                    VStack(alignment: .leading) {
                        ForEach(tripPlan.tripPoints) { tripPoint in
                            HStack {
                                Image(name: getAttractionImageName(attractionName:  tripPoint.attractionName))
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(5)
                                VStack(alignment: .leading) {
                                    Text(tripPoint.attractionName)
                                    Text("Date: \(tripPoint.date, formatter: dateFormatter)")
                                }
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
                .onDelete(perform: deleteTripPlan)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Your Trips")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Label("Back", systemImage: "chevron.backward")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
    
    private func deleteTripPlan(at offsets: IndexSet) {
        tripPlans.remove(atOffsets: offsets)
        if let encoded = try? JSONEncoder().encode(tripPlans) {
            UserDefaults.standard.set(encoded, forKey: "TripPlans")
        }
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    private func getAttractionImageName(attractionName: String) -> String {
        if let attraction = attractions.first(where: {$0.name == attractionName}) {
            return attraction.baseImageName
        }
        
        return "templeImg"
    }
}

#Preview {
    TripsView(tripPlans: .constant([]))
}
