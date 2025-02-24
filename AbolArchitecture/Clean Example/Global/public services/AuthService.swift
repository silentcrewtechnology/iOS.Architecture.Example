//
//  AuthService.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 18.02.2025.
//

import Foundation

public protocol AuthServiceProtocol {
    var isUserAuth: Bool { get set }
}

public final class AuthService: AuthServiceProtocol {
    
    public static let shared = AuthService()
    
    private let authKey = "isUserAuth"
    private let defaults: UserDefaults
    
    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    public var isUserAuth: Bool {
        get {
            defaults.bool(forKey: authKey)
        }
        set {
            defaults.set(newValue, forKey: authKey)
        }
    }
}
