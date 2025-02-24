//
//  StartFlowCoordinator.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import Architecture
import Router
import UIKit

final class StartFlowCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private var startFeature: FeatureProtocol
    var navigation: UINavigationController?
    
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
        self.startFeature = StartFeature<StartVC>(
            viewProperties: StartVC.ViewProperties(),
            createViewClosure: { viewProperties in
                StartVC(viewProperties: viewProperties)
            })
    }
    
    func startFlow(data: Any?) {
        let startVC = startFeature.runFlow(data: nil)
        navigation = UINavigationController(rootViewController: startVC as! UIViewController)
        if let navigation {
            routerService.setRootViewController(viewController: navigation)
        }
    }
    
    func setupFlow(completion: @escaping Closure<Any?>) {
        startFeature.runNewFlow = { flow in
            completion(flow)
        }
    }
}
