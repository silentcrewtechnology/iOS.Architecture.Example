//
//  Extension.swift
//  AbolArchitecture
//
//  Created by firdavs on 14.08.2024.
//

import UIKit

extension UITableViewCell {
    
    static func toTableViewCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        tableView.register(Self.self, forCellReuseIdentifier: Self.identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.identifier, for: indexPath) as! Self
        return cell
    }
}
