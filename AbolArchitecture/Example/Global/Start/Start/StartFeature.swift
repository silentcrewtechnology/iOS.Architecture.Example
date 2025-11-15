//
//  StartFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import Architecture
import UIKit

final class StartFeature<VC: ViewProtocol>: FeatureProtocol {
    
    deinit {
        print("💀 удалился StartFeature")
    }
    
    // MARK: Properties
    private let viewHandler: StartViewServicesHandlerProtocol
    private let factory: StartServiceFactoryProtocol
    private let createViewClosure: (VC.ViewProperties) -> VC
    private let viewProperties: VC.ViewProperties
    private lazy var vc: VC = createViewClosure(viewProperties)
    
    enum Action {
        // Добавь случаи, если понадобится
    }
    
    // MARK: Init
    init(
        viewProperties: VC.ViewProperties,
        factory: StartServiceFactoryProtocol = StartServiceFactory(),
        createViewClosure: @escaping (VC.ViewProperties) -> VC,
        viewHandler: StartViewServicesHandlerProtocol = StartViewServicesHandler()
    ) {
        self.viewProperties = viewProperties
        self.factory = factory
        self.createViewClosure = createViewClosure
        self.viewHandler = viewHandler
    }
    
    // MARK: Protocol methods
    
    var runNewFlow: ((Any) -> Void)?
    
    /// Запускаем флоу, возвращая созданный view
    func runFlow(data: Any?) -> (any ViewProtocol)? {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.runNewFlow?(1)
        }
        return vc
    }
    
    private func handleAction(_ action: Action) {
        // switch action {
        // }
    }
    
    // MARK: Private
    
    private func initialLogicServices() { }
    
    private func initialUIServices() { }
}
