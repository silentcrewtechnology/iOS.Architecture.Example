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
    private let mainFeature: FeatureCoordinatorProtocol
    private let textFIeldFeature: FeatureCoordinatorProtocol
    
    init(
        routerService: RouterService,
        tabBarFeature: TabBarFeature,
        startFeature: StartFeature,
        profileFeature: ProfileFeature,
        mainFeature: MainFeature,
        textFIeldFeature: TextFIeldFeature
    ) {
        self.routerService = routerService
        self.tabBarFeature = tabBarFeature
        self.startFeature = startFeature
        self.profileFeature = profileFeature
        self.mainFeature = mainFeature
        self.textFIeldFeature = textFIeldFeature
    }
    
    func setRoot() {
        guard let builder = startFeature.runFlow(data: nil) else { return }
        routerService.setRootViewController(viewController: builder.view as! UIViewController)
    }
    
    func setupFlow() {
        startFeature.runNewFlow = { [weak self] flow in
            guard let self = self else { return }
            var viewControllers: [UIViewController] = []
            
            guard let mainBuilder = self.mainFeature.runFlow(data: nil) else { return }
            viewControllers.append(mainBuilder.view as! UIViewController)
            
            guard let textFIeldBuilder = self.textFIeldFeature.runFlow(data: nil) else { return }
            viewControllers.append(textFIeldBuilder.view as! UIViewController)
            
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
