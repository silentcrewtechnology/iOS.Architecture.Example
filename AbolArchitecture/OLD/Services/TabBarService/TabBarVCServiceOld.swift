//
//  TabBarVCService.swift
//  PaymentSocialServices
//
//  Created by firdavs on 07.05.2024.
//
import ImagesService
import UIKit

struct TabBarVCService {
    
    private lazy var tabs: [Tabs] = [
        .main,
        .profile,
        .textField
    ]
}

extension TabBarVCService {
    
    enum Tabs: Int {
        case main
        case profile
        case textField
        
        func image() -> UIImage {
            switch self {
            case .main:
                return .ic16Home
            case .profile:
                return .ic16User
            case .textField:
                return .ic24Comment
            }
        }
        
        func name() -> String {
            switch self {
            case .main:
                return "Таблица"
            case .profile:
                return "Профиль"
            case .textField:
                return "TextField"
            }
        }
    }
}
