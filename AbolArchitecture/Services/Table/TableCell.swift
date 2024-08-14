//
//  TableCell.swift
//  AbolArchitecture
//
//  Created by firdavs on 14.08.2024.
//

import DesignSystem
import Components
import Extensions
import Architecture
import UIKit

enum TableCell {
    
    case iconTitle(leading: DSRowBlocks, center: DSRowBlocks, tap: ClosureEmpty)
    
    func cell() -> UIView {
        switch self {
       
        case let .iconTitle(leading, center, tap):
            let rowView = DSCreationRowsViewService().createViewRowWithBlocks(
                leading: leading,
                center: center,
                trailing: nil
            )
            rowView.addTapGesture { tap() }
            return rowView
        }
    }
}
