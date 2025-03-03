// 
//  BannersViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Architecture
import DesignSystem

protocol BannersViewServicesHandlerProtocol {
    
    func setServices(
        bannersButtonService: ButtonViewServiceProtocol
    )
    
    func getViewFromServices() -> BannersVC.ViewProperties
    
    func handleAction(_ state: BannersViewServicesHandler.State)
}

public final class BannersViewServicesHandler: BannersViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился BannersViewServicesHandler")
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
    public func handleAction(_ state: BannersViewServicesHandler.State) {
        switch state {
        // case .someState:
        //    someUIService?.update(with: nil, onTextChanged: nil)
        }
    }
    
    public func getViewFromServices() -> BannersVC.ViewProperties {
        guard
            let bannersButtonService
        else { return .init() }
        return .init(
            buttonView: bannersButtonService.view
        )
    }
}
