//
//  AppDelegate.swift
//  Architecture
//
//  Created by firdavs on 02.05.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sceneConfiguration = UISceneConfiguration(
            name: Constants.configurationName,
            sessionRole: connectingSceneSession.role
        )
        return sceneConfiguration
    }
}

fileprivate struct Constants {
    static let configurationName = "Default Configuration"
}
