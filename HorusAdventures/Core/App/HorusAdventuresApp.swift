//
//  HorusAdventuresApp.swift
//  HorusAdventures
//
//  Created by Alex Gav on 20.09.2024.
//

import SwiftUI

@main
struct HorusAdventuresApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var backgroundSoundManager: BackgroundSoundManager = .shared
    @StateObject private var notificationManager: NotificationManager = .shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .active:
                        if backgroundSoundManager.isMusicOn {
                            backgroundSoundManager.resumeBackgroundMusic()
                        }
                    case .background, .inactive:
                        backgroundSoundManager.pauseBackgroundMusic()
                        notificationManager.scheduleReminderNotification()
                    default:
                        break
                    }
                }
        }
    }
    
    init() {
        if (!UserDefaults.standard.bool(forKey: "isFirstOn")) {
            UserDefaults.standard.set(true, forKey: "isFirstOn")
            UserDefaults.standard.set(true, forKey: "isMusicOn")
            UserDefaults.standard.set(0.5, forKey: "musicVolume")
        }
    }
}
