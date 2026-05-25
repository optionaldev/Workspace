//
//  ShoppingViewModel.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

import Foundation
import Combine

@MainActor
final class ShoppingViewModel: ObservableObject {
    
    /// Controls whether the undo button is shown.
    @Published var canUndo: Bool = false
    
    /// We use this ID to temporarily change the background before performing the deletion.
    @Published var highlightedEnglish: String?
    
    /// The backbone of the ShoppingView. Shows the list of manipulateable items.
    @Published var shoppingItems: [ShoppingItem]
    
    func didTap(item shoppingItem: ShoppingItem) {
        /// Prevent multiple rows from being in delete mode.
        guard highlightedEnglish == nil else {
            return
        }
        
        highlightedEnglish = shoppingItem.english
        
        /// Cancel any previous delete tasks, just in case.
        deleteTask?.cancel()
        
        /// Start a new async Task
        deleteTask = Task { [weak self] in
            /// Wait 100ms before deleting.
            try? await Task.sleep(for: .seconds(0.1))
            
            if Task.isCancelled == false {
                self?.delete(item: shoppingItem)
            }
        }
    }
    
    func undoDelete() {
        guard let lastDeleted else {
            return
        }
        
        shoppingItems.insert(lastDeleted.item, at: min(lastDeleted.index, shoppingItems.count))
        self.lastDeleted = nil
        canUndo = false
    }
    
    // MARK: Init
    
    init() {
        if let shoppingData = Constants.shoppingMock.data(using: .utf8) {
            do {
                let shoppingItemsDecodables = try JSONDecoder().decode([ShoppingItemDecodable].self, from: shoppingData)
                shoppingItems = shoppingItemsDecodables.compactMap { ShoppingItem(fromDecodable: $0) }
                return
            } catch {
                debug(error)
            }
        }
        shoppingItems = []
    }
    
    // MARK: - Private
    
    /// This tasks allows us to delay the deletion of the shopping item in
    /// order for the deletion to not feel too sudden.
    private var deleteTask: Task<Void, Never>?
    
    /// Stores the last deleted item and its position in order for us to be able to
    /// undo the action if needed.
    private var lastDeleted: (item: ShoppingItem, index: Int)?
    
    /// Remove the item from the array + any clean-up necessary.
    private func delete(item shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.firstIndex(of: shoppingItem) else {
            highlightedEnglish = nil
            return
        }
        
        /// Save enough info to support the undo functionality
        lastDeleted = (shoppingItem, index)
        shoppingItems.remove(at: index)
        highlightedEnglish = nil
        canUndo = true
    }
}
