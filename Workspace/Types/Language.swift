//
//  Language.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 27.05.2026.
//



enum Language: String, OptionallyInitializable {
    
    case english  = "US"
    case romanian = "RO"
    case spanish  = "ES"
    
    var next: Self {
        switch self {
        case .english:
            return .romanian
        case .romanian:
            return .spanish
        case .spanish:
            return .english
        }
    }
}
