//
//  Attraction.swift
//  HorusAdventures
//
//  Created by Alex Gav on 20.09.2024.
//

import Foundation
import CoreLocation

struct Attraction: Identifiable {
    
    let id = UUID()
    let type: Kind
    let name: String
    let baseImageName: String
    let location: String
    let coordinates: CLLocationCoordinate2D
    let visitable: Bool
    let history: String
    let touristInterest: String
}
