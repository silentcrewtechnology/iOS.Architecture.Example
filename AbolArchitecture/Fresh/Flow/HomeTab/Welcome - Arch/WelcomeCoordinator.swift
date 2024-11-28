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
    case infoAboutApp
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
        guard let vc = welcomeFeature.runFlow(data: data)?.view as? UIViewController
        else { return }
        
        routerService.present(with: .viewController(vc))
    }
}
