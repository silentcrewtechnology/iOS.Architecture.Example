//
//  TableDelegate.swift
//  AbolArchitecture
//
//  Created by firdavs on 14.08.2024.
//

import UIKit

final class TableDelegate: NSObject, UITableViewDelegate {
    
    private var sections: [Section] = []

    public func update(with sections: [Section]) {
        self.sections = sections
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = sections[indexPath.section].rows[indexPath.row]
        row.didTap?(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = sections[indexPath.section].rows[indexPath.row]
        return row.height ?? UITableView.automaticDimension
    }
}

