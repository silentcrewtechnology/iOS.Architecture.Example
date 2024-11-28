////
////  MainVCUpdater.swift
////  AbolArchitecture
////
////  Created by firdavs on 04.06.2024.
////
//
//import ArchitectureTableView
//import Foundation
//import Architecture
//
//final class MainVCUpdaterOld: ViewUpdater<TableViewVC> {
//    
//    var viewProperties: TableViewVC.ViewProperties
//    
//    //MARK: - Main state view model
//    enum State {
//       
//    }
//    
//    public var state: State? {
//        didSet { self.stateManager() }
//    }
//    
//    private func stateManager(){
//        guard let state = self.state else { return }
//        update(self.viewProperties)
//    }
//    
//    override init(
//        viewProperties: TableViewVC.ViewProperties,
//        update: @escaping Closure<TableViewVC.ViewProperties>
//    ) {
//        self.viewProperties = viewProperties
//        super.init(
//            viewProperties: viewProperties,
//            update: update
//        )
//    }
//}
