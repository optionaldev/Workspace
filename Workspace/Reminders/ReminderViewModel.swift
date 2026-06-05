//
//  ReminderViewModel.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

import Combine
import Foundation
import UserNotifications
import UIKit

enum NotificationAuthorizationStatus {
    
    case notKnown
    case granted
    case denied
}

final class ReminderViewModel: ObservableObject {
    
    @Published var authorizationStatus: UNAuthorizationStatus = .notDetermined
    
    @Published var reminders: [Reminder]
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            if let error {
                debug(error)
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                if granted {
                    self?.authorizationStatus = .authorized
                } else {
                    self?.authorizationStatus = .denied
                }
            }
        }
    }
    
    init() {
        if let reminderData = Constants.reminderMock.data(using: .utf8) {
            do {
                let reminderDecodables = try JSONDecoder().decode([ReminderDecodable].self, from: reminderData)
                reminders = reminderDecodables.compactMap { Reminder(fromDecodable: $0) }
                debug("reminders read successfully \(reminders.count)")
            } catch {
                debug(error)
                reminders = []
            }
        } else {
            reminders = []
        }
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            debug("getNotificationSettings returned \(settings)")
            DispatchQueue.main.async { [weak self] in
                self?.authorizationStatus = settings.authorizationStatus
            }
        }
    }
}
