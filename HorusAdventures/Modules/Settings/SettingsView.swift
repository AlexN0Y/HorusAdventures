//
//  SettingsView.swift
//  HorusAdventures
//
//  Created by Alex Gav on 23.09.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var backgroundSoundManager = BackgroundSoundManager.shared
    @StateObject private var notificationManager: NotificationManager = .shared
    
    var body: some View {
        ScrollView {
            VStack {
                
                Divider()
                volumeChange
                Divider()
                onOffMusic
                Divider()
                onOffNotifications
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Settings")
        }
    }
    
    private var volumeChange: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Volume")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
            
            HStack {
                Image(systemName: "speaker.fill")
                    .foregroundColor(.gray)
                
                Slider(value: $backgroundSoundManager.musicVolume, in: 0...1)
                    .accentColor(.yellow)
                
                Image(systemName: "speaker.wave.3.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
    private var onOffMusic: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Music")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
            
            Toggle(isOn: $backgroundSoundManager.isMusicOn) {
                Text(backgroundSoundManager.isMusicOn ? "On" : "Off")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            .toggleStyle(SwitchToggleStyle(tint: .yellow))
        }
        .padding()
    }
    
    private var onOffNotifications: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Notifications")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.primary)
            
            Toggle(isOn: $notificationManager.areNotificationsOn) {
                Text(notificationManager.areNotificationsOn ? "On" : "Off")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            .toggleStyle(SwitchToggleStyle(tint: .yellow))
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
