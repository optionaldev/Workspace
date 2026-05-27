//
//  OptionallyInitializable.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 27.05.2026.
//

protocol OptionallyInitializable: RawRepresentable where RawValue == String {}
extension OptionallyInitializable {
    
    init?(rawValue: String?) {
        guard let rawValue else {
            return nil
        }
        self.init(rawValue: rawValue)
    }
}
