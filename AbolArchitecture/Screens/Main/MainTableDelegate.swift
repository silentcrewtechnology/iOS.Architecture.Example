//
//  MainTableDelegate.swift
//  AbolArchitecture
//
//  Created by firdavs on 04.06.2024.
//

import UIKit

final class MainTableDelegate: NSObject, UITableViewDelegate {
    
    private var componentsCell: [Any] = []

    public func update(with componentsCell: [Any]) {
        self.componentsCell = componentsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

