//
//  ReminderMock.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

enum Constants {
    static let reminderMock = """
[
    {
        "id": "cr2",
        "time": "18:00",
        "rate": "daily"
    },{
        "id": "c1",
        "time": "18:00",
        "rate": "onDemand"
    },{
        "id": "c2",
        "time": "18:00",
        "rate": "onDemand"
    },{
        "id": "c1l3",
        "time": "19:00",
        "rate": "threeTimesAWeek",
        "days": [1,3,5]
    },{ 
        "id": "s_ds",
        "time": "18:00",
        "rate": "everyThirdDay"
    },{
        "id": "s2",
        "time": "18:00",
        "rate": "everyThirdDay"
    }
]
"""
}
