//
//  StringExtension.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 27.05.2026.
//

extension String {
    
    var flag: String {
        unicodeScalars
            .compactMap { UnicodeScalar(127397 + $0.value) }
            .map { String($0) }
            .joined()
    }
}
