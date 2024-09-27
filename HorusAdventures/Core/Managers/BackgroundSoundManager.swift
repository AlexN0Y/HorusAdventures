//
//  BackgroundSoundManager.swift
//  HorusAdventures
//
//  Created by Alex Gav on 23.09.2024.
//

import SwiftUI
import AVFoundation

@MainActor
class BackgroundSoundManager: ObservableObject {
    
    static let shared = BackgroundSoundManager()
    private var player: AVAudioPlayer?
    
    @Published var isMusicOn: Bool {
        didSet {
            UserDefaults.standard.set(isMusicOn, forKey: "isMusicOn")
            if isMusicOn {
                playBackgroundMusic()
            } else {
                pauseBackgroundMusic()
            }
        }
    }
    
    @Published var musicVolume: Float {
        didSet {
            UserDefaults.standard.set(musicVolume, forKey: "musicVolume")
            player?.volume = musicVolume
        }
    }
    
    func resumeBackgroundMusic() {
        guard isMusicOn else { return }
        player?.play()
    }
    
    func playBackgroundMusic() {
        player?.play()
    }
    
    func pauseBackgroundMusic() {
        player?.pause()
    }
    
    private init() {
        self.isMusicOn = UserDefaults.standard.bool(forKey: "isMusicOn")
        self.musicVolume = UserDefaults.standard.float(forKey: "musicVolume")
        setupBackgroundMusic()
    }
    
    private func setupBackgroundMusic() {
        if let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.volume = musicVolume
                if isMusicOn {
                    playBackgroundMusic()
                }
            } catch {
                print("Error loading background music: \(error.localizedDescription)")
            }
        }
    }
}

