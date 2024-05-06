//
//  TableViewBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

struct TableViewBuilder: BuilderProtocol {
    
    typealias VIEW = TableView
    typealias UPDATER = TableViewUpdater
    
    public var view: TableView
    public var updater: TableViewUpdater
    
    public static func build(
        with viewProperties: TableView.ViewProperties
    ) -> TableViewBuilder {
        let view = TableView(
            viewProperties: viewProperties,
            style: .plain
        )
        let updater = TableViewUpdater(
            viewProperties: viewProperties
        )
        updater.bind(with: view)
        let selfBuilder = TableViewBuilder(
            with: view,
            with: updater
		)
        return selfBuilder
    }
    
    private init(
        with view: TableView,
        with updater: TableViewUpdater
    ) {
        self.view = view
        self.updater = updater
    }
}
