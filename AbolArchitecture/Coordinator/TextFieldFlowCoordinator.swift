//
//  TextFieldFlowCoordinator.swift
//  AbolArchitecture
//
//  Created by firdavs on 19.07.2024.
//
import Architecture
import Router
import UIKit

struct TextFieldFlowCoordinator: CoordinatorProtocol {
    
    private let routerService: RouterService
    private let textFieldFeature: FeatureCoordinatorProtocol
    
    init(
        routerService: RouterService,
        textFieldFeature: TextFIeldFeature
    ) {
        self.routerService = routerService
        self.textFieldFeature = textFieldFeature
    }
    
    func setupFlow(completion: @escaping Closure<Any?>) {
        
    }
    
    func startFlow(data: Any?) {
        guard let textFieldBuilder = self.textFieldFeature.runFlow(data: nil) else { return }
        let viewController = (textFieldBuilder.view as! UIViewController)
        self.routerService.pushMainNavigation(
            to: viewController,
            animated: true
        )
    }
}
