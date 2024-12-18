// 
//  WelcomeCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import UIKit
import Router
import Architecture

enum WelcomeFlow {
    case newFlowOne
    case newFlowTwo
}

final class WelcomeCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private let welcomeFeature: WelcomeFeature
    
    init(
        routerService: RouterService,
        welcomeFeature: WelcomeFeature = .init()
    ) {
        self.routerService = routerService
        self.welcomeFeature = welcomeFeature
    }
    
    /// Настройки флоу
    func setupFlow(completion: @escaping Closure<Any?>) {
        welcomeFeature.runNewFlow = completion
    }
    
    /// Запуск нового флоу фичи
    func startFlow(data: Any?) {
        let welcomeVC = welcomeFeature.runFlow(data: data)
        
        if let vc = welcomeVC as? UIViewController {
            routerService.pushMainNavigation(to: vc, animated: true)
        }
    }
}
