////
////  TabBarFlowCoordinator.swift
////  AbolArchitecture
////
////  Created by firdavs on 02.05.2024.
////
//import Router
//import Architecture
//import UIKit
//
//final class TabBarFlowCoordinatorOld: CoordinatorProtocol {
//    
//    private let routerService: RouterService
//    private let tabBarFeature: FeatureCoordinatorProtocol
//    private var startFeature: FeatureCoordinatorProtocol
//    private let profileFeature: FeatureCoordinatorProtocol
//    private var mainFeature: FeatureCoordinatorProtocol
//    
//    init(
//        routerService: RouterService,
//        tabBarFeature: TabBarFeature,
//        startFeature: StartFeature,
//        profileFeature: ProfileFeature,
//        mainFeature: MainFeature
//    ) {
//        self.routerService = routerService
//        self.tabBarFeature = tabBarFeature
//        self.startFeature = startFeature
//        self.profileFeature = profileFeature
//        self.mainFeature = mainFeature
//    }
//    
//    func setupFlow(completion: @escaping Closure<Any?> = { _ in }) {
//        self.mainFeature.runNewFlow = { mainFlow in
//            completion(mainFlow)
//        }
//    }
//    
//    func startFlow(data: Any?) {
//        var viewControllers: [UIViewController] = []
//        
//        guard let mainBuilder = self.mainFeature.runFlow(data: nil) else { return }
//        let rootViewController = mainBuilder.view as! UIViewController
//        let navigationViewController = UINavigationController(
//            rootViewController: rootViewController
//        )
//        viewControllers.append(navigationViewController)
//        
//        guard let profileBuilder = self.profileFeature.runFlow(data: nil) else { return }
//        viewControllers.append(profileBuilder.view as! UIViewController)
//        
//        guard let tabBarBuilder = self.tabBarFeature.runFlow(data: viewControllers) else { return }
//        let viewController = (tabBarBuilder.view as! UIViewController)
//        
//        self.routerService.present(
//            with: .viewController(viewController),
//            animation: false,
//            transitionStyle: .coverVertical,
//            presentationStyle: .fullScreen
//        )
//    }
//}
