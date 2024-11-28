//
//  Extension + UIView.swift
//  PaymentSocialServices
//
//  Created by firdavs on 08.05.2024.
//

import UIKit
import Architecture

public extension UIView {
    
    static func dequeueReusableCell(
        with tableView: UITableView,
        with indexPath: IndexPath
    ) -> Self {
        tableView.register(Self.self, forCellReuseIdentifier: String(describing: Self.self))
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Self.self), for: indexPath)
        return cell as! Self
    }
}
