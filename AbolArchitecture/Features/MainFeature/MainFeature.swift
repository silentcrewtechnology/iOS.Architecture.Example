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
    private let mainTableDataSource: MainTableDataSource
    private let mainTableDelegate: MainTableDelegate
    
    init() {
        self.mainTableDataSource = MainTableDataSource()
        self.mainTableDelegate = MainTableDelegate()
        self.tableViewBuilder = TableViewBuilder(
            with: .init(
                allowsSelection: false,
                separatorColor: .clear,
                backgroundColor: .clear,
                separatorInset: .zero,
                dataSources: self.mainTableDataSource,
                delegate: self.mainTableDelegate,
                didTapGesture: {}
            )
        )
        self.mainVCBuilder = MainVCBuilder(
            with: .init(
                screenTitle: "",
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
        
        let componentCell1 = MainComponentCell.button(
            leading: leading,
            center: center1,
            tap: { [ weak self] in
                self?.runNewFlow?(MainFlow.textField)
            }
        )
        let componentCell2 = MainComponentCell.button(
            leading: leading,
            center: center2,
            tap: { [ weak self] in
               
            }
        )
        let componentCell3 = MainComponentCell.button(
            leading: leading,
            center: center3,
            tap: { [ weak self] in
               
            }
        )
        let cells = [componentCell1, componentCell2, componentCell3]
        mainTableDataSource.update(with: cells)
        tableViewBuilder.viewUpdater.state = .reloadData
    }
}

