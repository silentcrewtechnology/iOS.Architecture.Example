//
//  MainVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 04.06.2024.
//

import UIKit
import ArchitectureTableView
import Architecture

struct MainVCBuilder: BuilderProtocol {
   
    typealias V = TableViewVC
    typealias U = MainVCUpdater
    
    public var view: TableViewVC
    public var viewUpdater: MainVCUpdater
    
    init(with viewProperties: TableViewVC.ViewProperties) {
        view = TableViewVC(
            viewProperties: viewProperties
        )
        viewUpdater = MainVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
