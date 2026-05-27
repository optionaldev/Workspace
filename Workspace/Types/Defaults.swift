//
//  Defaults.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 27.05.2026.
//

import Foundation

private extension Constants {
    
    static let shoppingLanguageKey = "shoppingLanguage"
}

enum Defaults {
    
    static var shoppingLanguage: Language {
        get {
            return Language(rawValue: UserDefaults.standard.string(forKey: Constants.shoppingLanguageKey)) ?? .english
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Constants.shoppingLanguageKey)
        }
    }
}
