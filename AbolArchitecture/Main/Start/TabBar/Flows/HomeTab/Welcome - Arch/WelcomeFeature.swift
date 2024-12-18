// 
//  WelcomeFeature.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import Foundation
import Architecture
import DesignSystem

final class WelcomeFeature: FeatureProtocol {
    
    deinit {
        print("💀 удалился WelcomeFeature")
    }
    
    private var viewHandler: WelcomeViewServicesHandlerProtocol?
    private var factory: WelcomeServiceFactoryProtocol
    public var vc: WelcomeVC
    
    // MARK: Logic Services
    
    private enum Action {
        case tapButtonFlowOne
        case tapButtonFlowTwo
    }
    
    init(
        viewProperties: WelcomeVC.ViewProperties = .init(),
        factory: WelcomeServiceFactoryProtocol = WelcomeServiceFactory()
    ) {
        self.vc = WelcomeVC(
            viewProperties: viewProperties
        )
        self.factory = factory
    }
    
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any ViewProtocol)? {
        let name = data as? String ?? "Wrong Name"
        initialLogicServices()
        initialUIServices(name: name)
        return vc
    }
    
    private func handleAction(_ action: Action) {
        switch action {
        case .tapButtonFlowOne:
            runNewFlow?(WelcomeFlow.newFlowOne)
        case .tapButtonFlowTwo:
            runNewFlow?(WelcomeFlow.newFlowTwo)
        }
    }
    
    private func initialLogicServices() {
        
    }
    
    private func initialUIServices(name: String) {
        let flowOneButtonService = factory.setupFlowOneButtonService(onTap: { [weak self] in
            guard let self else { return }
            handleAction(.tapButtonFlowOne)
        })
        
        let flowTwoButtonService = factory.setupFlowTwoButtonService(onTap: { [weak self] in
            guard let self else { return }
            handleAction(.tapButtonFlowTwo)
        })
        
        viewHandler = WelcomeViewServicesHandler(
            labelService: factory.setupLabelService(name: name),
            buttonFlowOneService: flowOneButtonService,
            buttonFlowTwoService: flowTwoButtonService
        )
        if let viewProperties = viewHandler?.getViewServices() {
            // Если нужно дополнить или исправить viewProperties,
            // то делаем это здесь
            vc.update(with: viewProperties)
        }
    }
}
