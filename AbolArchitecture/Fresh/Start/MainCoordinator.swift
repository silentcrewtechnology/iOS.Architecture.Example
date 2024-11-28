//
//  MainCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//
import Architecture
import Router
import Foundation
import ArchitectureTableView

struct MainCoordinator: MainCoordinatorProtocol {
    
    private let routerService: RouterService
    private let startFlowCoordinator: RootCoordinatorProtocol
    private let tabBarFlowCoordinator: CoordinatorProtocol
    private let welcomeCoordinator: WelcomeCoordinator
    
    init(routerService: RouterService) {
        self.routerService = routerService
        self.startFlowCoordinator = StartFlowCoordinator(routerService: routerService)
        self.tabBarFlowCoordinator = TabBarFlowCoordinator(routerService: routerService)
        self.welcomeCoordinator = WelcomeCoordinator(routerService: routerService)
    }
    
    func setRoot() {
        startFlowCoordinator.setRoot()
    }
    
    func setupCoordinatorsFlow() {
        setupStartFlowCoordinator()
        setupTabBarFlowCoordinator()
        setupWelcomeCoordinator()
    }
    
    private func setupStartFlowCoordinator() {
        startFlowCoordinator.setupFlow(completion: { _ in
            tabBarFlowCoordinator.startFlow(data: nil)
        })
    }
    
    private func setupTabBarFlowCoordinator() {
        tabBarFlowCoordinator.setupFlow(completion: { flow in
            if let tabBarFlow = flow as? TabBarFlow {
                switch tabBarFlow {
                case .homeWelcome(let welcomeText):
                    welcomeCoordinator.startFlow(data: welcomeText)
                case .profileSettings:
                    break
                }
            }
        })
    }
    
    private func setupWelcomeCoordinator() {
        welcomeCoordinator.setupFlow(completion: { flow in
            if let welcomeFlow = flow as? WelcomeFlow {
                switch welcomeFlow {
                case .infoAboutApp:
                    break
                }
            }
        })
    }
}
