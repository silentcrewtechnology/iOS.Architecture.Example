// 
//  HomeVCBuilder.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//

import UIKit
import Architecture

struct HomeVCBuilder: BuilderProtocol {
 
    typealias V = HomeVC
    typealias U = HomeVCUpdater
    
    public var view: HomeVC
    public var viewUpdater: HomeVCUpdater
    
    init(with viewProperties: HomeVC.ViewProperties) {
        view = HomeVC(
            viewProperties: viewProperties
        )
        viewUpdater = HomeVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
