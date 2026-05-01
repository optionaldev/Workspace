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
            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Label("Calendar", systemImage: "calendar")
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
