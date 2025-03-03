// 
//  HomeFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Foundation
import Architecture

final class HomeFeature<VC: ViewProtocol>: FeatureProtocol {

    deinit {
        print("💀 удалился HomeFeature")
    }
    
    // MARK: - Properties
    private let factory: HomeServiceFactoryProtocol
    private var viewHandler: HomeViewServicesHandlerProtocol
    private lazy var vc: VC = createViewClosure(viewProperties)
    
    private let viewProperties: VC.ViewProperties
    private let createViewClosure: (VC.ViewProperties) -> VC
    
    // MARK: - Flow
    var runNewFlow: ((Any) -> Void)?
    
    // MARK: Logic Services
    // private var someLogicService: SomeLogicServiceProtocol?
    
    // MARK: Action
    enum Action {
        case tapOnBannersButton
    }
    
    // MARK: - Init
    init(
           viewProperties: VC.ViewProperties,
           factory: HomeServiceFactoryProtocol = HomeServiceFactory(),
           viewHandler: HomeViewServicesHandlerProtocol = HomeViewServicesHandler(),
           createViewClosure: @escaping (VC.ViewProperties) -> VC
       ) {
           self.viewProperties = viewProperties
           self.factory = factory
           self.viewHandler = viewHandler
           self.createViewClosure = createViewClosure
       }
       
    
    // MARK: - FeatureProtocol
    func runFlow(data: Any?) -> (any ViewProtocol)? {
        // Здесь можно добавить инициализацию логики или UI-сервисов, если потребуется
        initialUIServices(data: data)
        return vc
    }
    
    // MARK: handle Action
    private func handleAction(_ action: Action) {
        switch action {
         case .tapOnBannersButton:
            // Здесь вызываем функцию связанную с конкретным Action
            tapOnBannersButtonAction()
        }
    }
    
    // MARK: initialUI
    private func initialUIServices(data: Any?) {
        // Здесь создаем UI сервисы, обращаяс к factory при создании
        let buttonService = factory.setupBannersButtonViewService(onTap: { [weak self] in
            guard let self else { return }
            handleAction(.tapOnBannersButton)
        })
        
        let userName = data as? String ?? "Home"
        let text = "Привет, \(userName)!"
        
        let titleViewService = factory.setupTitleNameViewService(text: text)
        
        viewHandler.setServices(
            secondScreenButtonService: buttonService,
            titleViewService: titleViewService
        )
        
        if let viewProperties = viewHandler.getViewFromServices() as? VC.ViewProperties {
            // Если нужно дополнить или исправить viewProperties,
            // то делаем это здесь
            vc.update(with: viewProperties)
        }
    }
}

// MARK: Private methods
extension HomeFeature {
     private func tapOnBannersButtonAction() {
         runNewFlow?(TabBarFlow.toBannersFromHome)
     }
}
