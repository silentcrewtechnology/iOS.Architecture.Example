//
//  SceneDelegate.swift
//  Architecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import Resolver
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    // MARK: - DI
    private var mainCoordinator: MainCoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        mainCoordinator = MainCoordinator(routerService: .init())
        
        mainCoordinator?.setRoot()
        mainCoordinator?.setupCoordinatorsFlow()
    }
}

