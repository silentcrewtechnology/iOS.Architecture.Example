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
        let center1 = DSRowBlocks.atom(.label("Text Field", nil))
        let center2 = DSRowBlocks.atom(.label("componentCell2", nil))
        let center3 = DSRowBlocks.atom(.label("componentCell3", nil))
        
        let rowView1 = DSCreationRowsViewService().createViewRowWithBlocks(
            leading: leading,
            center: center1,
            trailing: nil
        )
        rowView1.addTapGesture { [ weak self] in
            self?.runNewFlow?(MainFlow.textField)
        }
        
        let rowView2 = DSCreationRowsViewService().createViewRowWithBlocks(
            leading: leading,
            center: center2,
            trailing: nil
        )
        
        let rowView3 = DSCreationRowsViewService().createViewRowWithBlocks(
            leading: leading,
            center: center3,
            trailing: nil
        )
        
        let cell = CellModel(view: rowView1, height: 60)
        let cell2 = CellModel(view: rowView2, height: 60)
        let cell3 = CellModel(view: rowView3, height: 60)
        
        
        let section = SectionModel(cells: [cell, cell2, cell3])
        tableDataSource.update(with: [section])
        tableDelegate.update(with: [section])
        tableViewBuilder.viewUpdater.state = .reloadData
    }
}

