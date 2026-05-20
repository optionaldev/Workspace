//
//  Reminder.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

import Foundation

struct ReminderDecodable: Decodable {
    
    let days: [Int]?
    let id: String?
    let time: String?
    let rate: String?
}

struct Reminder {
    
    let id: String
    let time: Time
    let rate: Rate
    let days: [Day]
    
    init?(fromDecodable decodable: ReminderDecodable) {
        guard let id = decodable.id,
              let time = decodable.time else
        {
            return nil
        }
        
        let timeComponents = time.components(separatedBy: ":").compactMap { Int($0) }
        
        guard timeComponents.count == 2,
              let hourComponent = timeComponents.first,
              let minuteComponent = timeComponents.last else
        {
            return nil
        }
        
        guard let rawRate = decodable.rate,
              let rate = Rate(rawValue: rawRate) else
        {
            return nil
        }
        self.id = id
        self.rate = rate
        self.time = Time(hour: hourComponent, minutes: minuteComponent)
        
        
        if let days = decodable.days {
            self.days = days.compactMap { Day(rawValue: $0) }
        } else {
            self.days = []
        }
    }
}

struct Time {
    
    let hour: Int
    let minutes: Int
}

enum Rate: String {
    
    case daily
    case onDemand
    case everyThirdDay
    case threeTimesAWeek
}

enum Day: Int {
    
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}
