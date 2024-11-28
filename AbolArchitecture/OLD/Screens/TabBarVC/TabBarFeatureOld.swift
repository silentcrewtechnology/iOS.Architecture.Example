//
//  TabBarFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

final class TabBarFeature: RunFlowFeatureProtocol {
    
    private var tabBarVCBuilder: TabBarVCBuilder
    
    init(
        tabBarVCBuilder: TabBarVCBuilder = TabBarVCBuilder(with: TabBarVC.ViewProperties())
    ) {
        self.tabBarVCBuilder = tabBarVCBuilder
    }
    
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any Architecture.BuilderProtocol)? {
        guard let viewControllers = data as? [UIViewController] else { return nil }
        let vp = createTabBarVCViewProperties(viewControllers: viewControllers)
        self.tabBarVCBuilder.viewUpdater.state = .setViewProperties(vp)
        return tabBarVCBuilder
    }
    
    private func setupTabBarVCBuilder(viewControllers: [UIViewController]) -> TabBarVCBuilder {
        return tabBarVCBuilder
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
            tintColor: .blue,
            barTintColor: .black,
            backgroundColor: .white
        )
        return vp
    }
}
