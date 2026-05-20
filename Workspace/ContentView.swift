//
//  ContentView.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 30.04.2026.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            /// At one point, calendar and reminders will be merged
            /// into one, but for now, we keep separate to learn new
            /// concepts like time picker.
            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Label("Calendar", systemImage: "calendar")
            }
            NavigationStack {
                ReminderView()
            }
            .tabItem {
                Label("Notes", systemImage: "pencil.and.list.clipboard")
            }
            NavigationStack {
                NotesView()
            }
            .tabItem {
                Label("Notes", systemImage: "pencil.and.list.clipboard")
            }
        }
    }
}

#Preview {
    ContentView()
}
