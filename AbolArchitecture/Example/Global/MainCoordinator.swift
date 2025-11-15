//
//  MainCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 18.02.2025.
//

import Architecture
import Router
import Foundation
import ArchitectureTableView

struct MainCoordinator: MainCoordinatorProtocol {
    
    private let routerService: RouterService
    private let startFlowCoordinator: CoordinatorProtocol
    private let authFlowCoordinator: CoordinatorProtocol
    private let tabBarFlowCoordinator: CoordinatorProtocol
    private let bannersCoordinator: BannersCoordinator
    
    init(routerService: RouterService) {
        self.routerService = routerService
        self.startFlowCoordinator = StartFlowCoordinator(routerService: routerService)
        self.authFlowCoordinator = AuthFlowCoordinator(routerService: routerService)
        self.tabBarFlowCoordinator = TabBarFlowCoordinator(routerService: routerService)
        self.bannersCoordinator = BannersCoordinator(routerService: routerService)
    }
    
    func setRoot() {
        startFlowCoordinator.startFlow(data: nil)
    }
    
    func setupCoordinatorsFlow() {
        setupStartFlowCoordinator()
        setupTabBarFlowCoordinator()
        setupAuthFlowCoordinator()
        setupBannersCoordinator()
    }
    
    
    private func setupStartFlowCoordinator() {
        startFlowCoordinator.setupFlow(completion: { _ in
            print("start setupFlow from startFlowCoordinator")
            
            // TODO: Убрать установку значения после
            AuthService.shared.isUserAuth = false
            let isAuthorized = AuthService.shared.isUserAuth
            
            if isAuthorized {
                tabBarFlowCoordinator.startFlow(data: nil)
            } else {
                authFlowCoordinator.startFlow(data: nil)
            }
        })
    }
    
    private func setupTabBarFlowCoordinator() {
        tabBarFlowCoordinator.setupFlow(completion: { flow in
            if let tabBarFlow = flow as? TabBarFlow {
                switch tabBarFlow {
                case .toBannersFromHome:
                    bannersCoordinator.startFlow(data: nil)
                }
            }
        })
    }
    
    private func setupAuthFlowCoordinator() {
        authFlowCoordinator.setupFlow(completion: { flow in
            switch flow as? AuthFlow {
            case .tabBar(let userName):
                tabBarFlowCoordinator.startFlow(data: userName)
            case .none:
                break
            }
        })
    }
    
    private func setupBannersCoordinator() {
        bannersCoordinator.setupFlow(completion: { _ in })
    }
}
