//
//  Sanitizable.swift
//  Workspace
//
//  Created by Alexandru Pavalache on 22.05.2026.
//

protocol Sanitizable {
    
    associatedtype T: Decodable
    init?(fromDecodable decodable: T)
}
