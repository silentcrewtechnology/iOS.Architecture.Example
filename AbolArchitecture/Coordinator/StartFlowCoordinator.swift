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
    private var startFeature: FeatureCoordinatorProtocol

    init(
        routerService: RouterService,
        startFeature: StartFeature
    ) {
        self.routerService = routerService
        self.startFeature = startFeature
    }
    
    func setRoot() {
        guard let builder = startFeature.runFlow(data: nil) else { return }
        routerService.setRootViewController(viewController: builder.view as! UIViewController)
    }
    
    func setupFlow(completion: @escaping Closure<Any?>) {
        startFeature.runNewFlow = { flow in
            completion(flow)
        }
    }
}
