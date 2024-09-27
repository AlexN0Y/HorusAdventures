//
//  AchievementManager.swift
//  HorusAdventures
//
//  Created by Alex Gav on 25.09.2024.
//

import SwiftUI
import CoreLocation
import PhotosUI

class AchievementManager: ObservableObject {
    
    static let shared = AchievementManager()
    
    @Published var currentLocationCheck: Bool = false
    @Published var currentPhotoCheck: Bool = false
    @Published var achievements: [String] = [] {
        didSet {
            saveAchievements()
        }
    }
    
    private let userDefaultsKey = "achievements"
    
    init() {
        loadAchievements()
    }

    func loadAchievements() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            achievements = decoded
        } else {
            achievements = []
        }
    }
    
    func addAchievement(_ attraction: Attraction) {
        achievements.append(attraction.name)
    }

    func isAchievementUnlocked(for attraction: String) -> Bool {
        achievements.contains(attraction)
    }
    
    private func saveAchievements() {
        if let encoded = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
}
