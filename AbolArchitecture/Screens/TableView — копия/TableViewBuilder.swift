//
//  TableViewBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

struct TableViewBuilder: BuilderProtocol {
    
    typealias V = TableView
    typealias U = TableViewUpdater
    
    public var view: TableView
    public var viewUpdater: TableViewUpdater
    
    init(with viewProperties: TableView.ViewProperties) {
        view = TableView(
            viewProperties: viewProperties, 
            style: .plain
        )
        viewUpdater = TableViewUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
