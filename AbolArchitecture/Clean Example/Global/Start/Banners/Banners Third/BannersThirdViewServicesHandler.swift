// 
//  BannersThirdViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 03.03.2025.
//

import Architecture
import DesignSystem

protocol BannersThirdViewServicesHandlerProtocol {
    
    func setServices(
        // someUIService: SomeUIServiceProtocol
    )
    
    func getViewFromServices() -> BannersThirdVC.ViewProperties
    
    func handleAction(_ state: BannersThirdViewServicesHandler.State)
}

public final class BannersThirdViewServicesHandler: BannersThirdViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился BannersThirdViewServicesHandler")
    }
    
    // MARK: UI
    // private var someUIService: SomeUIServiceProtocol?
    
    // MARK: Init
    func setServices(
        // someUIService: SomeUIServiceProtocol
    ) {
        // self.someUIService = someUIService
    }
    
    public enum State {
        // Здесь описываются состояния вью
        // case someState
    }
    
    // MARK: Protocol
    public func handleAction(_ state: BannersThirdViewServicesHandler.State) {
        switch state {
        // case .someState:
        //    someUIService?.update(with: nil, onTextChanged: nil)
        }
    }
    
    public func getViewFromServices() -> BannersThirdVC.ViewProperties {
        // guard
        //     let someUIService
        // else { return .init() }
        return .init(
        //     someView: someUIService.view
        )
    }
}
