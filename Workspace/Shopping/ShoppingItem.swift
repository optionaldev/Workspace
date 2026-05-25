//
//  Shopping.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

struct ShoppingItem: Equatable, Identifiable, Sanitizable {
    
    let english: String
    let romanian: String
    let spanish: String
    
    // MARK: Identifiable conformance
    
    var id: String {
        return english
    }
    
    // MARK: Init & Sanitizable conformance
    
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
