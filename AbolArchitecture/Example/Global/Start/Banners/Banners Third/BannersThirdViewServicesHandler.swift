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
        bannersButtonService: ButtonViewServiceProtocol
    )
    
    func getViewFromServices() -> BannersThirdVC.ViewProperties
    
    func handleAction(_ state: BannersThirdViewServicesHandler.State)
}

public final class BannersThirdViewServicesHandler: BannersThirdViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился BannersThirdViewServicesHandler")
    }
    
    // MARK: UI
    private var bannersButtonService: ButtonViewServiceProtocol?
    
    // MARK: Init
    func setServices(
        bannersButtonService: ButtonViewServiceProtocol
    ) {
        self.bannersButtonService = bannersButtonService
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
        guard
            let bannersButtonService
        else { return .init() }
       return .init(
           buttonView: bannersButtonService.view
       )
    }
}
