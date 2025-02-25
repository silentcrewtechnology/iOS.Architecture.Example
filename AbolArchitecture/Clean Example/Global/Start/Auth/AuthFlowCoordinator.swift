//
//  AuthFlowCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 18.02.2025.
//

import Architecture
import Router
import UIKit

enum AuthFlow {
    case tabBar
}

final class AuthFlowCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private var authFeature: FeatureProtocol

    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
        self.authFeature = AuthFeature<AuthVC>(
            viewProperties: AuthVC.ViewProperties(),
            createViewClosure: { viewProperties in
                AuthVC(viewProperties: viewProperties)
            })
    }
    
    func startFlow(data: Any?) {
        let authVC = authFeature.runFlow(data: nil)
        if let vc = authVC as? UIViewController {
            routerService.present(with: .viewController(vc),
                                      transitionStyle: .crossDissolve,
                                      presentationStyle: .fullScreen,
                                      completion: { })
        }
    }
    
    func setupFlow(completion: @escaping Closure<Any?>) {
        authFeature.runNewFlow = completion
    }
}
