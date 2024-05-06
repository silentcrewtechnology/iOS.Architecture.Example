//
//  TabBarVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import UIKit
import Architecture

struct TabBarVCBuilder: BuilderProtocol {
   
    typealias VIEW = TabBarVC
    typealias UPDATER = TabBarVCUpdater
    
    public var view: TabBarVC
    public var updater: TabBarVCUpdater
    
    public static func build(
        with viewProperties: TabBarVC.ViewProperties
    ) -> TabBarVCBuilder {
        let viewController = TabBarVC(
            viewProperties: viewProperties
        )
        let updater = TabBarVCUpdater(
            viewProperties: viewProperties
        )
        viewController.loadViewIfNeeded()
        updater.bind(with: viewController)
        let selfBuilder = TabBarVCBuilder(
            with: viewController,
            with: updater
        )
        return selfBuilder
    }
    
    private init(
        with viewController: TabBarVC,
        with updater: TabBarVCUpdater
    ) {
        self.view = viewController
        self.updater = updater
    }
}
