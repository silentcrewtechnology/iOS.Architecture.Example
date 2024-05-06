//
//  StartVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import UIKit
import Architecture

struct StartVCBuilder: BuilderProtocol {
   
    typealias V = StartVC
    typealias U = StartVCUpdater
    
    public var view: StartVC
    public var viewUpdater: StartVCUpdater
    
    init(with viewProperties: StartVC.ViewProperties) {
        view = StartVC(
            viewProperties: viewProperties
        )
        view.loadViewIfNeeded()
        viewUpdater = StartVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}

