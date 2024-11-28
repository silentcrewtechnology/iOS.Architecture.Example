//
//  ProfileVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import UIKit
import Architecture

struct ProfileVCBuilder: BuilderProtocol {
   
    typealias V = ProfileVC
    typealias U = ProfileVCUpdater
    
    public var view: ProfileVC
    public var viewUpdater: ProfileVCUpdater
    
    init(with viewProperties: ProfileVC.ViewProperties) {
        view = ProfileVC(
            viewProperties: viewProperties
        )
        viewUpdater = ProfileVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
