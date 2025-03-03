//
//  TabBarFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 25.02.2025.
//

import Architecture
import UIKit

final class TabBarFeature<VC: ViewProtocol>: FeatureProtocol {
    
    deinit {
        print("💀 удалился TabBarFeature")
    }
    
    private var factory: TabBarServiceFactoryProtocol
    private lazy var vc: VC = createViewClosure(viewProperties)
    private var viewHandler: TabBarViewServicesHandlerProtocol
    
    private let createViewClosure: (VC.ViewProperties) -> VC
    private let viewProperties: VC.ViewProperties
    
    // MARK: Init
    enum Action {
    }
    
    init(
        viewProperties: VC.ViewProperties,
        factory: TabBarServiceFactoryProtocol = TabBarServiceFactory(),
        createViewClosure: @escaping (VC.ViewProperties) -> VC,
        viewHandler: TabBarViewServicesHandlerProtocol = TabBarViewServicesHandler()
    ) {
        self.viewProperties = viewProperties
        self.factory = factory
        self.createViewClosure = createViewClosure
        self.viewHandler = viewHandler
    }
    
    // MARK: Protocol methods
    var runNewFlow: ((Any) -> Void)?
    
    
    func runFlow(data: Any?) -> (any ViewProtocol)? {
        initialLogicServices()
        initialUIServices()
        return vc
    }
    
    private func handleAction(_ action: Action) {
    }
    
    
    // MARK: Private
    private func initialLogicServices() {
    }
    
    private func initialUIServices() {
    }
    
    private func createTabBarVCViewProperties(
        viewControllers: [UIViewController]
    ) -> TabBarVC.ViewProperties {
        let vp = TabBarVC.ViewProperties(
            viewDidLayoutSubviews: {},
            viewWillAppear: {},
            viewDidAppear: {},
            viewControllers: viewControllers,
            selectedIndex: 0,
            tintColor: .Components.TabBarItem.Label.Color.active,
            barTintColor: .Components.TabBarItem.Label.Color.active,
            backgroundColor: .Components.TabBar.Background.Color.default
        )
        return vp
    }
}
