//
//  TabBarVC.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

public final class TabBarVC: UITabBarController, ViewProtocol {
    
    //MARK: - Main ViewProperties
    public struct ViewProperties {
        public let viewDidLayoutSubviews: ClosureEmpty
        public let viewWillAppear: ClosureEmpty
        public let viewDidAppear: ClosureEmpty
        public var viewControllers: [UIViewController]
        public var selectedIndex: Int
        public let tintColor: UIColor
        public let barTintColor: UIColor
        public let backgroundColor: UIColor
        
        public init(
            viewDidLayoutSubviews: @escaping ClosureEmpty = {},
            viewWillAppear: @escaping ClosureEmpty = {},
            viewDidAppear: @escaping ClosureEmpty = {},
            viewControllers: [UIViewController] = [],
            selectedIndex: Int = 0,
            tintColor: UIColor = .white,
            barTintColor: UIColor = .white,
            backgroundColor: UIColor = .white
        ) {
            self.viewDidLayoutSubviews = viewDidLayoutSubviews
            self.viewWillAppear = viewWillAppear
            self.viewDidAppear = viewDidAppear
            self.viewControllers = viewControllers
            self.selectedIndex = selectedIndex
            self.tintColor = tintColor
            self.barTintColor = barTintColor
            self.backgroundColor = backgroundColor
        }
    }
    var viewProperties: ViewProperties
    
    public init(viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        super.init(nibName: String(describing: Self.self), bundle: nil)
        setViewControllers(with: viewProperties)
        setupTabBar(with: viewProperties)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Outlets
    
    
    //MARK: - LifeCycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewProperties.viewWillAppear()
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewProperties.viewDidAppear()
    }

    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.viewProperties.viewDidLayoutSubviews()
    }
    
    public func update(with viewProperties: ViewProperties) {
        self.viewProperties = viewProperties
        setIndex(with: viewProperties)
        setViewControllers(with: viewProperties)
        setupTabBar(with: viewProperties)
    }
    
    private func setIndex(with viewProperties: ViewProperties?){
        self.selectedIndex = viewProperties?.selectedIndex ?? 0
    }
    
    private func setupTabBar(with viewProperties: ViewProperties?){
        self.tabBar.tintColor = viewProperties?.tintColor
        self.tabBar.barTintColor = viewProperties?.barTintColor
        
        self.tabBar.backgroundColor = viewProperties?.backgroundColor
        view.backgroundColor = viewProperties?.backgroundColor
        
        UINavigationBar.appearance().barTintColor = viewProperties?.backgroundColor
        UITabBar.appearance().barTintColor = viewProperties?.backgroundColor
    }
    
    private func setViewControllers(with viewProperties: ViewProperties?){
        self.setViewControllers(viewProperties?.viewControllers, animated: true)
    }
}
