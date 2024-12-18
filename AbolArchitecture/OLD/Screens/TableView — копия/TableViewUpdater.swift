//
//  TableViewBuilder.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

final class TableViewUpdater: ViewUpdater<TableView> {
    
    var viewProperties: TableView.ViewProperties
    
    //MARK: - Main state view manager
    enum State {
		case reloadData
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager() {
        guard let state = self.state else { return }
        switch state {
			case .reloadData:
				self.update(self.viewProperties)
        }
    }
    
    override init(
        viewProperties: TableView.ViewProperties,
        update: @escaping Closure<TableView.ViewProperties>
    ) {
        self.viewProperties = viewProperties
        super.init(
            viewProperties: viewProperties,
            update: update
        )
    }
}
