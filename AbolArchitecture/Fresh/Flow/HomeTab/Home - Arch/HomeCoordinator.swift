//// 
////  HomeCoordinator.swift
////  AbolArchitecture
////
////  Created by Валерий Васин on 15.11.2024.
////
//
//import UIKit
//import Router
//import Architecture
//
//enum HomeFlow {
//    case welcomeFlow
//    case info
//}
//
//// Заменить в Templates
//final class HomeCoordinator: CoordinatorProtocol {
//    
//    // MARK: - DI
//    private let routerService: RouterService
//    private let homeFeature: HomeFeature
//    
//     init(
//        routerService: RouterService,
//        homeFeature: HomeFeature
//         ) {
//            self.homeFeature = homeFeature
//             self.routerService = routerService
//         }
//    // Заменить в Templates
//    func setupFlow(completion: @escaping Closure<Any?>) {
//        
//    }
//    
//    // Заменить в Templates
//    func startFlow(data: Any?) {
//        guard let vc = homeFeature.runFlow(data: nil)?.view as? UIViewController else { return }
//        routerService.pushMainNavigation(to: vc, animated: true)
//    }
//}
