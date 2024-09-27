//
//  MapView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 20.09.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var locationManager: LocationManager = .shared
    @Binding var currentAttraction: Attraction
    @Binding var presentWeatherSheet: Bool
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 26.8206, longitude: 30.8025),
        span: MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
    )
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            showsUserLocation: true,
            annotationItems: attractions
        ) { attraction in
            MapAnnotation(coordinate: attraction.coordinates) {
                
                Image(name: attraction.type.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: 85,
                        height: 85,
                        alignment: .center
                    )
                    .onTapGesture {
                        currentAttraction = attraction
                        presentWeatherSheet = true
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $locationManager.showSettingsAlert) {
            Alert(
                title: Text("Location Access Required"),
                message: Text(locationManager.alertMessage),
                primaryButton: .default(Text("Settings")) {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
                        }
                    }
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    MapView(currentAttraction: .constant(attractions[1]), presentWeatherSheet: .constant(false))
}
