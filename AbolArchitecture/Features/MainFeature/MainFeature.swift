//
//  MainFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 04.06.2024.
//
import Architecture
import ArchitectureTableView
import DesignSystem
import Components
import UIKit

final class MainFeature: FeatureCoordinatorProtocol {
    
    private let mainVCBuilder: MainVCBuilder
    private let tableViewBuilder: TableViewBuilder
    private let tableDataSource: TableDataSource
    private let tableDelegate: TableDelegate
    
    init() {
        self.tableDataSource = TableDataSource()
        self.tableDelegate = TableDelegate()
        self.tableViewBuilder = TableViewBuilder(
            with: .init(
                allowsSelection: false,
                separatorColor: .clear,
                backgroundColor: .clear,
                separatorInset: .zero,
                dataSources: self.tableDataSource,
                delegate: self.tableDelegate,
                didTapGesture: {}
            )
        )
        self.mainVCBuilder = MainVCBuilder(
            with: .init(
                tableView: self.tableViewBuilder.view,
                confirmButtonView: nil, 
                activityIndicator: nil
            )
        )
    }
    
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        mainVCBuilder.view.setTabBar(with: .main)
        setCell()
        return mainVCBuilder
    }
    
    private func setCell() {
        // получилии с бека
        let leading = DSRowBlocks.atom(.image40(.ic24House, nil))
        let center1 = DSRowBlocks.atom(.title("Text Field", nil))
        let center2 = DSRowBlocks.atom(.title("componentCell2", nil))
        let center3 = DSRowBlocks.atom(.title("componentCell3", nil))
        
        let componentCell1 = TableCell.iconTitle(
            leading: leading,
            center: center1,
            tap: { [ weak self] in
                self?.runNewFlow?(MainFlow.textField)
            }
        )
        let componentCell2 = TableCell.iconTitle(
            leading: leading,
            center: center2,
            tap: { [ weak self] in
               
            }
        )
        let componentCell3 = TableCell.iconTitle(
            leading: leading,
            center: center3,
            tap: { [ weak self] in
               
            }
        )
        
        let row1 = Row(
            view: componentCell1.cell(),
            selectionStyle: .blue,
            height: 60
        )
        let row2 = Row(
            view: componentCell2.cell(),
            selectionStyle: .blue,
            height: 60
        )
        let row3 = Row(
            view: componentCell3.cell(),
            selectionStyle: .blue,
            height: 60
        )
        let section = Section(rows: [row1, row2, row3])
        tableDataSource.update(with: [section])
        tableDelegate.update(with: [section])
        tableViewBuilder.viewUpdater.state = .reloadData
    }
}

