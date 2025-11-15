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
        .settings
    ]
}

extension TabBarVCService {
    
    enum Tabs: Int {
        case main
        case settings
        
        func image() -> UIImage {
            switch self {
            case .main:
                return .ic16Home
            case .settings:
                return .ic16User
            }
        }
        
        func name() -> String {
            switch self {
            case .main:
                return "Главная"
            case .settings:
                return "Настройки"
            }
        }
    }
}
