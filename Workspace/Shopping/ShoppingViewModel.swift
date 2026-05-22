//
//  ShoppingViewModel.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

import Foundation
import Combine

final class ShoppingViewModel: ObservableObject {
    
    @Published var shoppingItems: [ShoppingItem]
    
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
}
