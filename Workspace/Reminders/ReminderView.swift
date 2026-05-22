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
        List(viewModel.reminders, id: \.id) { item in
            Text(item.id)
                .bold()
        }
        .foregroundStyle(.brown)
    }
}


#Preview {
    ReminderView()
}
