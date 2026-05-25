//
//  ShoppingView.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

import SwiftUI

struct ShoppingView: View {
    
    @StateObject private var viewModel = ShoppingViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            List {
                ForEach(viewModel.shoppingItems) { shoppingItem in
                    
                    /// Each row is represented by a button, tappable anywhere
                    Button {
                        viewModel.didTap(item: shoppingItem)
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: viewModel.highlightedEnglish == shoppingItem.english
                                  ? "largecircle.fill.circle"
                                  : "circle")
                            .foregroundStyle(.primary)
                            Text(shoppingItem.english)
                                .foregroundStyle(.primary)
                            Spacer()
                        }
                        .padding(.vertical, 6)
                        
                        /// Make the entire rectangular row tapable, not just
                        /// the exact pixels occupied by the content.
                        .contentShape(Rectangle())
                    }
                    /// Prevent default blue button styling.
                    .buttonStyle(.plain)
                    
                    /// Custom row background. If this row is highlighted, show a soft accent-colored background.
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                viewModel.highlightedEnglish == shoppingItem.english
                                ? Color.accentColor.opacity(0.18)
                                : Color.clear
                            )
                            .padding(.vertical, 4)
                    )
                }
            }
            .listStyle(.plain)
            
            if viewModel.canUndo {
                Button("Undo") {
                    viewModel.undoDelete()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                .transition(.move(edge: .bottom).combined(with: .opacity))
            }
        }
        
        .animation(.easeInOut(duration: 0.25), value: viewModel.shoppingItems)
        .animation(.easeInOut(duration: 0.25), value: viewModel.canUndo)
    }
}
