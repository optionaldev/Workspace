//
//  NotesView.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 01.05.2026.
//

import SwiftUI

struct NotesView: View {

    var body: some View {
        List(placeholderItems, id: \.self) { item in
            NavigationLink(item) {
                NotesDetailView(name: item)
            }
        }
        /// This puts a navigation bar, but hides the content of the navigation bar.
        /// This is necessary because when transitioning from NotesView to
        /// NotesDetailView, there's a visual glitch where NotesView's List
        /// gets pushed down during transition.
        .navigationTitle("")
        .navigationBarHidden(false)
    }
    
    // MARK: - Private
    
    // To be replaced by API call
    private let placeholderItems = ["Dreams", "Journal", "Meditation", "Terminal"]
}
