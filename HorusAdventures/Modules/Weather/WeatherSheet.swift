//
//  WeatherSheet.swift
//  HorusAdventures
//
//  Created by Alex Gav on 24.09.2024.
//

import SwiftUI

struct WeatherSheet: View {
    
    let attraction: Attraction
    var onGoToAttraction: () -> Void
    
    @State private var weatherInfo: String = "Fetching weather..."
    
    var body: some View {
        VStack {
            Text("Weather Window")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.vertical, 8)
            
            Text("Know Before You Go!")
                .font(.title)
                .padding(.bottom, 8)
            
            Text("Check the current weather at each attraction to ensure your visit is as smooth as possible. Prepare for the Egyptian sun or unexpected rain with live updates.")
                .padding(.horizontal)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            
            Text(weatherInfo)
            
            Button(action: {
                onGoToAttraction()
            }) {
                Text("Go to Attraction")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.yellow)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                    )
                    .frame(height: 56)
                    .padding(.horizontal)
            }
            .padding(.top)
            
            Spacer()
        }
        .task {
            let info = try! await WeatherService.shared.fetchWeather(for: attraction)
            
            guard let info else {
                weatherInfo = "Unable to get the weather."
                return
            }
            
            weatherInfo = "The weather is \(info.0).\n Current temperature is: \(info.1)°C"
        }
    }
}

#Preview {
    WeatherSheet(
        attraction: attractions[1],
        onGoToAttraction: {}
    )
}
