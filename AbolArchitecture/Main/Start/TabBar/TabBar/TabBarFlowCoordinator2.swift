////
////  TabBarFlowCoordinator.swift
////  AbolArchitecture
////
////  Created by Валерий Васин on 19.11.2024.
////
//
//
//import Router
//import Architecture
//import UIKit
//
//enum TabBarFlow {
//    case homeWelcome(String)
//    case profileSettings
//}
//
//final class TabBarFlowCoordinator: CoordinatorProtocol {
//    private let routerService: RouterService
////    private let tabBarFeature: FeatureCoordinatorProtocol
////    private var homeFeature: FeatureProtocol
//    private var settingsFeature: FeatureProtocol
//    
//    init(routerService: RouterService) {
//        self.routerService = routerService
////        self.tabBarFeature = TabBarFeature()
////        self.homeFeature = HomeFeature<HomeVC>()
//        self.settingsFeature = SettingsFeature()
//    }
//    
//    /// Настройки флоу
//    func setupFlow(completion: @escaping Closure<Any?>) {
////        homeFeature.runNewFlow = completion
////        profileFeature.runNewFlow = completion
//    }
//    
//    /// Запуск нового флоу фичи
//    func startFlow(data: Any?) {
//        
////        var viewControllers: [UIViewController] = []
////        
////        // TODO:
////        // добавить func createFlow(data: Any?) -> Any?
////        // к координатору временно
////        // из фичи напрямую обращаются к UIView через билдер
////        // может хранить в координаторе билдеры?
////        
////        let homeVC = homeFeature.runFlow(data: nil)
////        
////        if let vc = homeVC as? UIViewController {
////            let navigationVC = UINavigationController(rootViewController: vc)
////            navigationVC.navigationBar.tintColor = .white
////            navigationVC.tabBarItem.title = "Главная"
////            viewControllers.append(navigationVC)
////        }
////        
////        let settingsVC = settingsFeature.runFlow(data: nil)
////        if let vc = settingsVC as? UIViewController {
////            let navigationVC = UINavigationController(rootViewController: vc)
////            navigationVC.navigationBar.tintColor = .white
////            navigationVC.tabBarItem.title = "Настройки"
////            viewControllers.append(navigationVC)
////        }
//        
////        guard let tabBarViewController = tabBarFeature.runFlow(
////            data: viewControllers)?.view as? UITabBarController
////        else { return }
//        
////        routerService.setRootViewController(viewController: tabBarViewController)
////        routerService.setupTabBarControllerVC(with: tabBarViewController)
//    }
//}
