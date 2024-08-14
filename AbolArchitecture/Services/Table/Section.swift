//
//  Section.swift
//  AbolArchitecture
//
//  Created by firdavs on 14.08.2024.
//

import UIKit

struct Section {
    let rows: [Row]
}

struct Row {
    let view: UIView
    let selectionStyle: UITableViewCell.SelectionStyle
    let height: CGFloat?
    let didTap: ((IndexPath) -> Void)? = nil
    
    public init(
        view: UIView,
        selectionStyle: UITableViewCell.SelectionStyle = .blue,
        height: CGFloat?,
        didTap: ((IndexPath) -> Void)? = nil
    ) {
        self.view = view
        self.selectionStyle = selectionStyle
        self.height = height
    }
}
