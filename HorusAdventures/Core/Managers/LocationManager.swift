//
//  LocationManager.swift
//  HorusAdventures
//
//  Created by Alex Gav on 25.09.2024.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var locationAuthorizationStatus: CLAuthorizationStatus?
    @Published var showSettingsAlert = false
    @Published var alertMessage = "Location services are disabled. Please enable location services in settings."
    
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func askForLocationPermission() {
        let status = locationManager.authorizationStatus
        
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .denied, .restricted:
            alertMessage = "Location services are disabled. Please enable location services in settings."
            showSettingsAlert = true
            
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.locationAuthorizationStatus = status
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    func isUserNearAttraction(attraction: Attraction) -> Bool {
        guard let userLocation = currentLocation else { return false }
        let attractionLocation = CLLocation(latitude: attraction.coordinates.latitude, longitude: attraction.coordinates.longitude)
        let userCLLocation = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        
        let distanceInMeters = userCLLocation.distance(from: attractionLocation)
        return distanceInMeters <= 350
    }
}
