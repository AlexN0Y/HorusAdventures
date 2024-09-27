//
//  MainView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 22.09.2024.
//

import SwiftUI

struct MainView: View {
    
    @State var showStartMessage = true
    @State var presentSheet = false
    @State var navigateToAttraction = false
    @State var currentAttraction: Attraction = attractions[0]
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    MapView(
                        currentAttraction: $currentAttraction,
                        presentWeatherSheet: $presentSheet
                    )
                    .colorScheme(.light)
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        topBar(geometry)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        bottomBar(geometry)
                    }
                    
                    if showStartMessage {
                        StartView {
                            Task {
                                withAnimation {
                                    showStartMessage = false
                                }
                            }
                        }
                        .transition(.opacity)
                        .zIndex(1)
                    }
                }
            }
            .sheet(isPresented: $presentSheet) {
                WeatherSheet(
                    attraction: currentAttraction,
                    onGoToAttraction: {
                        presentSheet = false
                        navigateToAttraction = true
                    }
                )
                .presentationDetents([.height(360)])
            }
            .navigationDestination(isPresented: $navigateToAttraction) {
                AttractionView(attraction: currentAttraction)
            }
        }
    }
    
    private var planTripButton: some View {
        NavigationLink(destination: RoutePlanningView()) {
            Text("Route Planning")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.yellow)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                )
        }
    }
    
    private var settingsButton: some View {
        NavigationLink(destination: SettingsView()) {
            Image(systemName: "gear")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.yellow)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                )
        }
    }
    
    private func topBar(_ geometry: GeometryProxy) -> some View {
        HStack {
            planTripButton
            
            settingsButton
        }
        .frame(height: geometry.size.height * 0.07)
    }
    
    private func bottomBar(_ geometry: GeometryProxy) -> some View {
        NavigationLink(destination: AchievementsView()) {
            Text("Achievements")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.yellow) 
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.black, lineWidth: 1)
                        )
                )
                .frame(height: geometry.size.height * 0.07)
                .padding()
        }
    }
}

#Preview {
    MainView()
}
