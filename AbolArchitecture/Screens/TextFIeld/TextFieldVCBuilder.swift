//
//  TextFieldVCBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 05.06.2024.
//

import UIKit
import ArchitectureTableView
import Architecture

struct TextFieldVCBuilder: BuilderProtocol {
   
    typealias V = TextFieldVC
    typealias U = TextFieldVCUpdater
    
    public var view: TextFieldVC
    public var viewUpdater: TextFieldVCUpdater
    
    init(with viewProperties: TextFieldVC.ViewProperties) {
        view = TextFieldVC(
            viewProperties: viewProperties
        )
        viewUpdater = TextFieldVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
