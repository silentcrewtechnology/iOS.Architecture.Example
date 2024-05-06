//
//  ProfileVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import UIKit
import Architecture

struct ProfileVCBuilder: BuilderProtocol {
   
    typealias VIEW = ProfileVC
    typealias UPDATER = ProfileVCUpdater
    
    public var view: ProfileVC
    public var updater: ProfileVCUpdater
    
    public static func build(
        with viewProperties: ProfileVC.ViewProperties
    ) -> ProfileVCBuilder {
        let viewController = ProfileVC(
            viewProperties: viewProperties
        )
        let updater = ProfileVCUpdater(
            viewProperties: viewProperties
        )
        viewController.loadViewIfNeeded()
        updater.bind(with: viewController)
        let selfBuilder = ProfileVCBuilder(
            with: viewController,
            with: updater
        )
        return selfBuilder
    }
    
    private init(
        with viewController: ProfileVC,
        with updater: ProfileVCUpdater
    ) {
        self.view = viewController
        self.updater = updater
    }
}
