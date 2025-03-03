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
    case toBannersFromHome
}

final class TabBarFlowCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private var tabBarFeature: FeatureProtocol?
    
    // MARK: Tabs:
    private var homeFeature: FeatureProtocol
    //    private var settingsFeature: FeatureProtocol
    
    init(
        routerService: RouterService
    ) {
        self.routerService = routerService
        
        self.homeFeature = HomeFeature<HomeVC>(
            viewProperties: HomeVC.ViewProperties(),
            createViewClosure: { viewProperties in
                HomeVC(viewProperties: viewProperties)
            }
        )
            
    }
    
    func startFlow(data: Any?) {
        setupTabBarFeature(data: data)
        
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
        homeFeature.runNewFlow = completion
    }
}

// MARK: Private methods
extension TabBarFlowCoordinator {
    private func setupTabBarFeature(data: Any?) {
        let viewControllers = createTabsControllers(data: data)
        let viewProperties = createTabBarVCViewProperties(viewControllers: viewControllers)
        
        
        self.tabBarFeature = TabBarFeature<TabBarVC>(
            viewProperties: viewProperties,
            createViewClosure: { viewProperties in
                TabBarVC(viewProperties: viewProperties)
            }
        )
    }
    
    private func createTabsControllers(data: Any?) -> [UIViewController] {
        var viewControlelrs: [UIViewController] = []
        if let homeVC = homeFeature.runFlow(data: data) as? UIViewController {
            let navigationHomeVC = UINavigationController(rootViewController: homeVC)
            navigationHomeVC.setTabBar(with: .main)
            viewControlelrs.append(navigationHomeVC)
        }
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .blue
        let navigationProfileVC = UINavigationController(rootViewController: profileVC)
        navigationProfileVC.setTabBar(with: .settings)
        viewControlelrs.append(navigationProfileVC)
        return viewControlelrs
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
