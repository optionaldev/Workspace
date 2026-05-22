//
//  Shopping.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

struct ShoppingItem: Sanitizable {
    
    let english: String
    let romanian: String
    let spanish: String
    
    init?(fromDecodable decodable: ShoppingItemDecodable) {
        guard let english = decodable.english,
              let romanian = decodable.romanian,
              let spanish = decodable.spanish else
        {
            return nil
        }
        self.english = english
        self.romanian = romanian
        self.spanish = spanish
    }
}
