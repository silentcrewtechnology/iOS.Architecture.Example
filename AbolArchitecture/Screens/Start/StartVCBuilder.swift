//
//  StartVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import UIKit
import Architecture

struct StartVCBuilder: BuilderProtocol {
   
    typealias VIEW = StartVC
    typealias UPDATER = StartVCUpdater
    
    public var view: StartVC
    public var updater: StartVCUpdater
    
    public static func build(
        with viewProperties: StartVC.ViewProperties
    ) -> StartVCBuilder {
        let viewController = StartVC(
            viewProperties: viewProperties
        )
        let updater = StartVCUpdater(
            viewProperties: viewProperties
        )
        viewController.loadViewIfNeeded()
        updater.bind(with: viewController)
        let selfBuilder = StartVCBuilder(
            with: viewController,
            with: updater
        )
        return selfBuilder
    }
    
    private init(
        with viewController: StartVC,
        with updater: StartVCUpdater
    ) {
        self.view = viewController
        self.updater = updater
    }
}

