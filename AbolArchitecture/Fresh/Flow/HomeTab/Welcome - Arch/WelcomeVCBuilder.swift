// 
//  WelcomeVCBuilder.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import UIKit
import Architecture

struct WelcomeVCBuilder: BuilderProtocol {

    typealias V = WelcomeVC
    typealias U = WelcomeVCUpdater
    
    public var view: WelcomeVC
    public var viewUpdater: WelcomeVCUpdater
    
    init(with viewProperties: WelcomeVC.ViewProperties) {
        view = WelcomeVC(
            viewProperties: viewProperties
        )
        viewUpdater = WelcomeVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
