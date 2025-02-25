////
////  TabBarVCBuilder.swift
////  AbolArchitecture
////
////  Created by firdavs on 02.05.2024.
////
//import UIKit
//import Architecture
//
//struct TabBarVCBuilder: BuilderProtocol {
//   
//    typealias V = TabBarVC
//    typealias U = TabBarVCUpdater
//    
//    public var view: TabBarVC
//    public var viewUpdater: TabBarVCUpdater
//    
//    init(with viewProperties: TabBarVC.ViewProperties) {
//        view = TabBarVC(
//            viewProperties: viewProperties
//        )
//        viewUpdater = TabBarVCUpdater(
//            viewProperties: viewProperties,
//            update: view.update
//        )
//    }
//}
