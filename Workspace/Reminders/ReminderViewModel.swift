//
//  ReminderViewModel.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

import Foundation
import Combine

class ReminderViewModel: ObservableObject {
    
    @Published var reminders: [Reminder]
    
    init() {
        if let reminderData = Constants.reminderMock.data(using: .utf8) {
            do {
                let reminderDecodables = try JSONDecoder().decode([ReminderDecodable].self, from: reminderData)
                reminders = reminderDecodables.compactMap { Reminder(fromDecodable: $0) }
                return
            } catch {
                debug(error)
            }
        }
        reminders = []
    }
}
