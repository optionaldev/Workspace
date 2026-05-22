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
        List(viewModel.shoppingItems, id: \.spanish) { item in
            Text(item.spanish)
        }
    }
}
