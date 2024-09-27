//
//  AttractionView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 20.09.2024.
//

import SwiftUI
import CoreLocation
import PhotosUI

struct AttractionView: View {
    
    let attraction: Attraction
    @State private var weatherInfo: String = "Loading weather..."
    @State private var temperatureInfo: String = ""
    @State private var showImagePicker: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var userImages: [UIImage] = []
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Image(name: attraction.baseImageName)
                                .resizable()
                                .frame(width: abs(geometry.size.width - 32), height: 200)
                                .scaledToFill()
                                .border(Color.yellow, width: 2)
                                .padding()
                            
                            ForEach(userImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .frame(width: abs(geometry.size.width - 32), height: 200)
                                    .scaledToFill()
                                    .border(Color.yellow, width: 2)
                                    .padding()
                            }
                        }
                    }
                    .frame(height: 200)
                    
                    HStack(spacing: 8) {
                        Text("\(temperatureInfo)°C\n \(weatherInfo)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundStyle(.yellow)
                            .multilineTextAlignment(.center)
                            .padding(4)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke()
                                    .foregroundStyle(.yellow)
                            )
                        
                        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                            Text("Add photo")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundStyle(.yellow)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke()
                                        .foregroundStyle(.yellow)
                                )
                        }
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self),
                                   let uiImage = UIImage(data: data) {
                                    userImages.append(uiImage)
                                    saveUserImages()
                                }
                            }
                        }
                        
                        NavigationLink(destination: GetAchievementView(attraction: attraction)) {
                            Text("Get an achievement")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundStyle(.yellow)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke()
                                        .foregroundStyle(.yellow)
                                )
                        }
                    }
                    .frame(height: 100)
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About place:")
                            .font(.title2)
                            .padding(.top)
                        
                        Text(attraction.history)
                            .font(.body)
                            .padding(.bottom)
                        
                        Text("Tourist interest:")
                            .font(.title2)
                        
                        Text(attraction.touristInterest)
                            .font(.body)
                            .padding(.bottom)
                    }
                    .padding()
                    
                    Spacer()
                }
            }
            .task {
                loadUserImages()
                (weatherInfo, temperatureInfo) = await fetchWeather(for: attraction)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Attraction")
    }
    
    private func fetchWeather(for attraction: Attraction) async -> (String, String) {
        do {
            let weather = try await WeatherService.shared.fetchWeather(for: attraction)
            return (weather?.0 ?? "Weather data not available", weather?.1 ?? "")
        } catch {
            return ("Failed to fetch weather", "")
        }
    }
    
    private func saveUserImages() {
        let key = "userImages_\(attraction.name)"
        UserDefaults.standard.saveImages(userImages, forKey: key)
    }
    
    private func loadUserImages() {
        let key = "userImages_\(attraction.name)"
        userImages = UserDefaults.standard.retrieveImages(forKey: key)
    }
}

#Preview {
    AttractionView(attraction: attractions[1])
}
