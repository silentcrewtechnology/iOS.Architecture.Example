//
//  MainTableDataSource.swift
//  AbolArchitecture
//
//  Created by firdavs on 04.06.2024.
//
import DesignSystem
import Components
import Extensions
import Architecture
import UIKit

final class MainTableDataSource: NSObject, UITableViewDataSource {
    
    private var componentsCell: [MainComponentCell] = []

    public func update(with componentsCell: [MainComponentCell]) {
        self.componentsCell = componentsCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return componentsCell.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let componentCell = componentsCell[indexPath.row]
        return componentCell.cell(tableView, cellForRowAt: indexPath)
    }
}


enum MainComponentCell {
    
    case button(leading: DSRowBlocks, center: DSRowBlocks, tap: ClosureEmpty)
    
    func cell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        switch self {
       
        case let .button(leading, center, tap):
            
            tableView.register(RowCell.self, forCellReuseIdentifier: String(describing: RowCell.self))
            let rowCell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath) as! RowCell
            
            let rowView = DSCreationRowsViewService().createViewRowWithBlocks(
                leading: leading,
                center: center,
                trailing: nil
            )
            rowView.addTapGesture { tap() }
            rowCell.customView = rowView
            return rowCell
        }
    }
}
