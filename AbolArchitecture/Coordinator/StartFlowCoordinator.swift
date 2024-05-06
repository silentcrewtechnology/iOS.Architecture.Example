//
//  StartFlowCoordinator.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import Router
import UIKit

final class StartFlowCoordinator: RootCoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private let tabBarFeature: FeatureCoordinatorProtocol
    private var startFeature: FeatureCoordinatorProtocol
    private let profileFeature: FeatureCoordinatorProtocol
    
    init(
        routerService: RouterService,
        tabBarFeature: TabBarFeature,
        startFeature: StartFeature,
        profileFeature: ProfileFeature
    ) {
        self.routerService = routerService
        self.tabBarFeature = tabBarFeature
        self.startFeature = startFeature
        self.profileFeature = profileFeature
    }
    
    func setRoot() {
        guard let builder = startFeature.runFlow(data: nil) else { return }
        routerService.setRootViewController(viewController: builder.view as! UIViewController)
    }
    
    func setupFlow() {
        startFeature.runNewFlow = { [weak self] flow in
            guard let self = self else { return }
            var viewControllers: [UIViewController] = []
            
            guard let profileBuilder = self.profileFeature.runFlow(data: nil) else { return }
            viewControllers.append(profileBuilder.view as! UIViewController)
            
            guard let tabBarBuilder = self.tabBarFeature.runFlow(data: viewControllers) else { return }
            let viewController = (tabBarBuilder.view as! UIViewController)
            
            self.routerService.present(
                with: .viewController(viewController),
                animation: false,
                transitionStyle: .coverVertical,
                presentationStyle: .fullScreen
            )
        }
    }
}
