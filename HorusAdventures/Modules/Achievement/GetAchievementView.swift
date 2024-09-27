//
//  GetAchievementView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 25.09.2024.
//

import SwiftUI
import PhotosUI

enum ActiveAlert: Identifiable {
    case achievement
    case locationAccessRequired
    case notClose

    var id: Int {
        self.hashValue
    }
}

struct GetAchievementView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var attraction: Attraction
    
    @StateObject private var achievementManager: AchievementManager = .shared
    @StateObject private var locationManager: LocationManager = .shared
    
    @State private var showPhotoPicker = false
    @State private var image: UIImage? = nil
    @State private var locationChecked = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var photoAdded = false
    @State private var userImages: [UIImage] = []
    @State private var activeAlert: ActiveAlert?
    
    var body: some View {
        VStack {
            Text("Unlock Achievements!")
                .font(.title)
                .padding()
            
            Text("Check in at each site using your geolocation, snap a photo, and unlock special achievements!")
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            HStack {
                Button(action: {
                    checkLocation()
                }) {
                    Text("Check Location")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                        .foregroundStyle(.yellow)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.yellow)
                        )
                }
                
                if locationChecked {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .frame(height: 56)
            .padding()
            
            HStack {
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
                            photoAdded = true
                        }
                    }
                }
                if photoAdded {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
            }
            .frame(height: 56)
            .padding()
            
            Spacer()
            
            if locationChecked && photoAdded {
                Button(action: {
                    achievementManager.addAchievement(attraction)
                    activeAlert = .achievement
                }) {
                    Text("Unlock Achievement")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Achievement")
        .alert(item: $activeAlert) { alertType in
            switch alertType {
            case .achievement:
                return Alert(
                    title: Text("Congratulations!"),
                    message: Text("You've unlocked an Achievement! You've just captured a piece of ancient history."),
                    dismissButton: .default(Text("OK")) {
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            case .locationAccessRequired:
                return Alert(
                    title: Text("Location Access Required"),
                    message: Text(locationManager.alertMessage),
                    primaryButton: .default(Text("Settings")) {
                        if let settingsURL = URL(string: UIApplication.openSettingsURLString),
                           UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL)
                        }
                    },
                    secondaryButton: .cancel()
                )
            case .notClose:
                return Alert(
                    title: Text("Checkup failed"),
                    message: Text("You're not close enough to an attraction."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .onReceive(locationManager.$showSettingsAlert) { newValue in
            if newValue {
                activeAlert = .locationAccessRequired
            }
        }
        .onAppear {
            loadCheckIn()
            loadUserImages()
            if !userImages.isEmpty {
                photoAdded = true
            }
        }
    }
    
    private func checkLocation() {
        locationManager.askForLocationPermission()
        
        if !locationChecked {
            locationChecked = locationManager.isUserNearAttraction(attraction: attraction)
            
            if locationChecked {
                saveCheckIn()
            } else {
                activeAlert = .notClose
            }
        }
    }
    
    private func saveCheckIn() {
        let key = "checkIn_\(attraction.name)"
        UserDefaults.standard.set(locationChecked, forKey: key)
    }
    
    private func loadCheckIn() {
        let key = "checkIn_\(attraction.name)"
        locationChecked = UserDefaults.standard.bool(forKey: key)
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
    GetAchievementView(attraction: attractions[1])
}
