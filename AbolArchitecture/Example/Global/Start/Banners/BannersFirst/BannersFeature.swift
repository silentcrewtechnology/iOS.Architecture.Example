// 
//  BannersFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Foundation
import Architecture

final class BannersFeature<VC: ViewProtocol>: FeatureProtocol {

    deinit {
        print("💀 удалился BannersFeature")
    }
    
    // MARK: - Properties
    private let factory: BannersServiceFactoryProtocol
    private var viewHandler: BannersViewServicesHandlerProtocol
    private lazy var vc: VC = createViewClosure(viewProperties)
    
    private let viewProperties: VC.ViewProperties
    private let createViewClosure: (VC.ViewProperties) -> VC
    
    // MARK: - Flow
    var runNewFlow: ((Any) -> Void)?
    
    // MARK: Logic Services
    // private var someLogicService: SomeLogicServiceProtocol?
    
    // MARK: Action
    enum Action {
        case tapSecondOnScreenButton
    }
    
    // MARK: - Init
    init(
        viewProperties: VC.ViewProperties,
        factory: BannersServiceFactoryProtocol = BannersServiceFactory(),
        viewHandler: BannersViewServicesHandlerProtocol = BannersViewServicesHandler(),
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
        initialUIServices() 
        return vc
    }
    
    // MARK: handle Action
    private func handleAction(_ action: Action) {
        switch action {
         case .tapSecondOnScreenButton:
            // Здесь вызываем функцию связанную с конкретным Action
            tapSecondButtonAction()
        }
    }
    
    // MARK: initialUI
    private func initialUIServices() {
        // Здесь создаем UI сервисы, обращаяс к factory при создании
        let buttonService = factory.setupButtonViewService(onTap: { [weak self] in
            guard let self else { return }
            handleAction(.tapSecondOnScreenButton)
        })
        
        viewHandler.setServices(
            bannersButtonService: buttonService
        )
        
        if let viewProperties = viewHandler.getViewFromServices() as? VC.ViewProperties {
            // Если нужно дополнить или исправить viewProperties,
            // то делаем это здесь
            vc.update(with: viewProperties)
        }
    }
}

// MARK: Private methods
extension BannersFeature {
    private func tapSecondButtonAction() {
        runNewFlow?(BannersFlow.toSecondScreen)
    }
}
