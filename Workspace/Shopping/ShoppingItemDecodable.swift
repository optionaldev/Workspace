//
//  ShoppingItemDecodable.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

struct ShoppingItemDecodable: Decodable {
    
    let english: String?
    let spanish: String?
    let romanian: String?
    
    enum CodingKeys: String, CodingKey {
        
        case english = "en"
        case spanish = "es"
        case romanian = "ro"
    }
}
