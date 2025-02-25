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
//    private let welcomeCoordinator: WelcomeCoordinator
    
    init(routerService: RouterService) {
        self.routerService = routerService
        self.startFlowCoordinator = StartFlowCoordinator(routerService: routerService)
        self.authFlowCoordinator = AuthFlowCoordinator(routerService: routerService)
        self.tabBarFlowCoordinator = TabBarFlowCoordinator(routerService: routerService)
//        self.welcomeCoordinator = WelcomeCoordinator(routerService: routerService)
    }
    
    func setRoot() {
        startFlowCoordinator.startFlow(data: nil)
    }
    
    func setupCoordinatorsFlow() {
        setupStartFlowCoordinator()
        setupTabBarFlowCoordinator()
        setupAuthFlowCoordinator()
//        setupWelcomeCoordinator()
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
//            tabBarFlowCoordinator.startFlow(data: nil)
        })
    }
    
    private func setupTabBarFlowCoordinator() {
        tabBarFlowCoordinator.setupFlow(completion: { flow in
            if let tabBarFlow = flow as? TabBarFlow {
                switch tabBarFlow {
                case .homeWelcome(let welcomeText):
                    print("main homeWelcome")
//                    welcomeCoordinator.startFlow(data: welcomeText)
                case .profileSettings:
                    print("main profileSettings")
                }
            }
        })
    }
    
    private func setupAuthFlowCoordinator() {
        authFlowCoordinator.setupFlow(completion: { flow in
            switch flow as? AuthFlow {
            case .tabBar:
                tabBarFlowCoordinator.startFlow(data: nil)
            case .none:
                break
            }
        })
    }
    
//    private func setupWelcomeCoordinator() {
//        welcomeCoordinator.setupFlow(completion: { flow in
//            if let welcomeFlow = flow as? WelcomeFlow {
//                switch welcomeFlow {
//                case .newFlowOne:
//                    //Здесь делаем startFlow у координатора flowOne
//                    break
//                case .newFlowTwo:
//                    //Здесь делаем startFlow у координатора flowTwo
//                    break
//                }
//            }
//        })
//    }
}


////
////  MainCoordinator.swift
////  AbolArchitecture
////
////  Created by Валерий Васин on 14.11.2024.
////
//import Architecture
//import Router
//import Foundation
//import ArchitectureTableView
//
//struct MainCoordinator: MainCoordinatorProtocol {
//
//    private let routerService: RouterService
//    private let startFlowCoordinator: RootCoordinatorProtocol
//    private let tabBarFlowCoordinator: CoordinatorProtocol
//    private let welcomeCoordinator: WelcomeCoordinator
//
//    init(routerService: RouterService) {
//        self.routerService = routerService
//        self.startFlowCoordinator = StartFlowCoordinator(routerService: routerService)
//        self.tabBarFlowCoordinator = TabBarFlowCoordinator(routerService: routerService)
//        self.welcomeCoordinator = WelcomeCoordinator(routerService: routerService)
//    }
//
//    func setRoot() {
//        startFlowCoordinator.setRoot()
//    }
//
//    func setupCoordinatorsFlow() {
//        setupStartFlowCoordinator()
//        setupTabBarFlowCoordinator()
//        setupWelcomeCoordinator()
//    }
//
//    private func setupStartFlowCoordinator() {
//        startFlowCoordinator.setupFlow(completion: { _ in
//            tabBarFlowCoordinator.startFlow(data: nil)
//        })
//    }
//
//    private func setupTabBarFlowCoordinator() {
//        tabBarFlowCoordinator.setupFlow(completion: { flow in
//            if let tabBarFlow = flow as? TabBarFlow {
//                switch tabBarFlow {
//                case .homeWelcome(let welcomeText):
//                    welcomeCoordinator.startFlow(data: welcomeText)
//                case .profileSettings:
//                    break
//                }
//            }
//        })
//    }
//
//    private func setupWelcomeCoordinator() {
//        welcomeCoordinator.setupFlow(completion: { flow in
//            if let welcomeFlow = flow as? WelcomeFlow {
//                switch welcomeFlow {
//                case .newFlowOne:
//                    //Здесь делаем startFlow у координатора flowOne
//                    break
//                case .newFlowTwo:
//                    //Здесь делаем startFlow у координатора flowTwo
//                    break
//                }
//            }
//        })
//    }
//}
