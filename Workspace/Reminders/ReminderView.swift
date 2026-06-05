//
//  ReminderView.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 04.05.2026.
//

import SwiftUI

struct ReminderView: View {
    
    @StateObject private var viewModel = ReminderViewModel()
    
    var body: some View {
        switch viewModel.authorizationStatus {
        case .authorized:
            List(viewModel.reminders, id: \.id) { item in
                Text(item.id)
            }
            .foregroundStyle(.brown)
        case .notDetermined:
            Text("Allow notifications in order to remind you at your chosen time.")
                .multilineTextAlignment(.center)
                .padding(15)
            Button("Request authorization") {
                viewModel.requestNotificationPermission()
            }
        default:
            Text("Something went wrong.")
        }
    }
}


#Preview {
    ReminderView()
}
