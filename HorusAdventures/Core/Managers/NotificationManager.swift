//
//  NotificationManager.swift
//  HorusAdventures
//
//  Created by Alex Gav on 26.09.2024.
//

import Foundation
import UserNotifications

class NotificationManager: ObservableObject {
    
    static let shared = NotificationManager()
    
    @Published var areNotificationsOn: Bool {
        didSet {
            UserDefaults.standard.set(areNotificationsOn, forKey: "areNotificationsOn")
            if areNotificationsOn {
                Task {
                    await requestAuthorization()
                }
            } else {
                removeAllPendingNotifications()
            }
        }
    }
    
    private init() {
        self.areNotificationsOn = UserDefaults.standard.bool(forKey: "areNotificationsOn")
    }
    
    @discardableResult
    func requestAuthorization() async -> Bool {
        let currentSettings = await UNUserNotificationCenter.current().notificationSettings()
        
        switch currentSettings.authorizationStatus {
        case .authorized, .provisional:
            return true
        case .notDetermined:
            do {
                let granted = try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound])
                return granted
            } catch {
                print("Error requesting notification authorization: \(error.localizedDescription)")
                return false
            }
        case .denied:
            return false
        default:
            return false
        }
    }
    
    func scheduleNotification(title: String, body: String, date: DateComponents) {
        Task {
            let authorisationRequest = await requestAuthorization()
            if areNotificationsOn && authorisationRequest {
                let content = UNMutableNotificationContent()
                content.title = title
                content.body = body
                content.sound = .default
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                try? await UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func scheduleReminderNotification() {
        Task {
            let authorisationRequest = await requestAuthorization()
            if areNotificationsOn && authorisationRequest {
                let content = UNMutableNotificationContent()
                content.title = "Don't forget about your trips"
                content.body = "Check your upcoming trips in the app"
                content.sound = .default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: "tripReminder", content: content, trigger: trigger)
                try? await UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func removeAllPendingNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
