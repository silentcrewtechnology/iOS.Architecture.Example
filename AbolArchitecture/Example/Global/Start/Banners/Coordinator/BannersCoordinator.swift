// 
//  BannersCoordinator.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import UIKit
import Router
import Architecture

enum BannersFlow {
    // Здесь перечисляем все переходы внутри одного флоу координатора
    case toSecondScreen
    case toThirdScreen
    case goHome
}

final class BannersCoordinator: CoordinatorProtocol {
    
    // MARK: - DI
    private let routerService: RouterService
    private var bannersFeature: FeatureProtocol?
    private var bannersSecondFeature: FeatureProtocol?
    private var bannersThirdFeature: FeatureProtocol?
    
     init(
        routerService: RouterService
     ) {
         self.routerService = routerService
     }
    
    /// Настройки нового флоу фичи
    func setupFlow(completion: @escaping Closure<Any?>) {
        setupBannersFeature()
        setupBannersSecondFeature()
        setupBannersThirdFeature()
    }
    
    /// Запуск первой фичи
    func startFlow(data: Any?) {
        let bannersVC = bannersFeature?.runFlow(data: data)
        
         if let vc = bannersVC as? UIViewController {
             routerService.pushMainNavigation(to: vc , animated: true)
         }
        
    }
}

// MARK: Private methods
extension BannersCoordinator {
    // здесь пишем все внутренние функции
    // такие как создание Features или создание внутренней логику
    
    private func navigationTo(flow: BannersFlow) {
        switch flow {
        case .toSecondScreen:
            navigateToSecondScreen()
        case .toThirdScreen:
            navigateToThirdScreen()
        case .goHome:
            goHome()
        }
    }
    
    // MARK: Navigate
    private func navigateToSecondScreen() {
        if let vc = bannersSecondFeature?.runFlow(data: nil) as? UIViewController {
            routerService.pushMainNavigation(to: vc , animated: true)
        }
    }
    
    private func navigateToThirdScreen() {
        if let vc = bannersThirdFeature?.runFlow(data: nil) as? UIViewController {
            routerService.pushMainNavigation(to: vc , animated: true)
        }
    }
    
    private func goHome() {
        routerService.popToRoot(animated: true)
        bannersFeature = nil
        bannersSecondFeature = nil
        bannersThirdFeature = nil
    }
    
    // MARK: Setup
    private func setupBannersFeature() {
        self.bannersFeature = BannersFeature<BannersVC>(
            viewProperties: BannersVC.ViewProperties(),
            createViewClosure: { viewProperties in
                BannersVC(viewProperties: viewProperties)
            }
        )
        
        bannersFeature?.runNewFlow = { [weak self] flow in
            guard let self else { return }
            if let bannersFlow = flow as? BannersFlow {
                navigationTo(flow: bannersFlow)
            }
        }
    }
    
    private func setupBannersSecondFeature() {
        self.bannersSecondFeature = BannersSecondFeature<BannersSecondVC>(
            viewProperties: BannersSecondVC.ViewProperties(),
            createViewClosure: { viewProperties in
                BannersSecondVC(viewProperties: viewProperties)
            }
        )
        
        
        bannersSecondFeature?.runNewFlow = { [weak self] flow in
            guard let self else { return }
            if let bannersFlow = flow as? BannersFlow {
                navigationTo(flow: bannersFlow)
            }
        }
    }
    
    private func setupBannersThirdFeature() {
        self.bannersThirdFeature = BannersThirdFeature<BannersThirdVC>(
            viewProperties: BannersThirdVC.ViewProperties(),
            createViewClosure: { viewProperties in
                BannersThirdVC(viewProperties: viewProperties)
            }
        )
        
        
        bannersThirdFeature?.runNewFlow = { [weak self] flow in
            guard let self else { return }
            if let bannersFlow = flow as? BannersFlow {
                navigationTo(flow: bannersFlow)
            }
        }
    }
}
