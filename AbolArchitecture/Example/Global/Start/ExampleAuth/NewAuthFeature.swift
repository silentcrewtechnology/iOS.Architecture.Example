// 
//  NewAuthFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 28.02.2025.
//

import Foundation
import Architecture

final class NewAuthFeature<VC: ViewProtocol>: FeatureProtocol {

    deinit {
        print("💀 удалился NewAuthFeature")
    }
    
    // MARK: - Properties
    private let factory: NewAuthServiceFactoryProtocol
    private var viewHandler: NewAuthViewServicesHandlerProtocol
    private lazy var vc: VC = createViewClosure(viewProperties)
    
    private let viewProperties: VC.ViewProperties
    private let createViewClosure: (VC.ViewProperties) -> VC
    
    // MARK: - Flow
    var runNewFlow: ((Any) -> Void)?
    
    // MARK: Logic Services
    // private var someLogicService: SomeLogicServiceProtocol?
    
    // MARK: Action
    enum Action {
        // case someAction
    }
    
    // MARK: - Init
    init(
           viewProperties: VC.ViewProperties,
           factory: NewAuthServiceFactoryProtocol = NewAuthServiceFactory(),
           viewHandler: NewAuthViewServicesHandlerProtocol = NewAuthViewServicesHandler(),
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
        // initialLogicServices()
        initialUIServices()
        return vc
    }
    
    // MARK: handle Action
    private func handleAction(_ action: Action) {
        switch action {
        // case .someAction:
            // Здесь вызываем функцию связанную с конкретным Action
            // someFunc()
        }
    }
    
    // MARK: initialUI
    private func initialUIServices() {
        // Здесь создаем UI сервисы, обращаяс к factory при создании
        // let someUIService: SomeUIServiceProtocol = factory.setupSomeUIService()
        
        viewHandler.setServices(
            imageViewServiceService: factory.setupLogoImageService(),
            inputAddCardViewService: factory.setupLoginInputService(onTextChange: nil),
            buttonViewService: factory.setupButtonService(onTap: nil),
            scanButtonVuewService: factory.scanCardButtonService(onTap: nil)
        )
        
        if let viewProperties = viewHandler.getViewFromServices() as? VC.ViewProperties {
            // Если нужно дополнить или исправить viewProperties,
            // то делаем это здесь
            vc.update(with: viewProperties)
        }
    }
}

// MARK: Private methods
extension NewAuthFeature {
    // private func someFunc() {
        
    // }
}
