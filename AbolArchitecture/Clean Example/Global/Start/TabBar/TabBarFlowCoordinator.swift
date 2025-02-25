//
//  TabBarFlowCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 25.02.2025.
//

import Architecture
import Router
import UIKit

enum TabBarFlow {
    case homeWelcome(String)
    case profileSettings
}

final class TabBarFlowCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private var tabBarFeature: FeatureProtocol?

    // MARK: Tabs:
    //    private var homeFeature: FeatureProtocol
//    private var settingsFeature: FeatureProtocol
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
    }
    
    func startFlow(data: Any?) {
//        guard let viewControllers = data as? [UIViewController] else { return }
        let viewControllers = createTabsControllers()
        let viewProperties = createTabBarVCViewProperties(viewControllers: viewControllers)
        
        
        self.tabBarFeature = TabBarFeature<TabBarVC>(
            viewProperties: viewProperties,
            createViewClosure: { viewProperties in
                TabBarVC(viewProperties: viewProperties)
            }
        )
        
        let tabBarVC = tabBarFeature?.runFlow(data: nil)
        if let vc = tabBarVC as? UIViewController {
            routerService.present(with: .viewController(vc),
                                      transitionStyle: .crossDissolve,
                                      presentationStyle: .fullScreen,
                                      completion: { })
        }
    }
    
    func setupFlow(completion: @escaping Closure<Any?>) {
        tabBarFeature?.runNewFlow = completion
    }
    
    // MARK: Private methods
    private func createTabsControllers() -> [UIViewController] {
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .red
        homeVC.tabBarItem.title = "Главная"
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue
        profileVC.tabBarItem.title = "Профиль"
        return [homeVC, profileVC]
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
