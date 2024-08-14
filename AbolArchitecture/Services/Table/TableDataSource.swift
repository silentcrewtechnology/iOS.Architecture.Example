//
//  TableDataSource.swift
//  AbolArchitecture
//
//  Created by firdavs on 14.08.2024.
//

import DesignSystem
import Components
import Extensions
import Architecture
import UIKit

final class TableDataSource: NSObject, UITableViewDataSource {
    
    private var sections: [Section] = []

    public func update(with sections: [Section]) {
        self.sections = sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowsCount = sections[section].rows.count
        return rowsCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        let row = section.rows[indexPath.row]
        let cell = row.view.toCell(tableView, cellForRowAt: indexPath)
        cell.selectionStyle = row.selectionStyle
        return cell
    }
}
