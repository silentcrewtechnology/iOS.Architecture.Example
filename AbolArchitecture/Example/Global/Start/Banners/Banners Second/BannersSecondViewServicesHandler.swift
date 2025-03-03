// 
//  BannersSecondViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Architecture
import DesignSystem

protocol BannersSecondViewServicesHandlerProtocol {
    
    func setServices(
        bannersButtonService: ButtonViewServiceProtocol
    )
    
    func getViewFromServices() -> BannersSecondVC.ViewProperties
    
    func handleAction(_ state: BannersSecondViewServicesHandler.State)
}

public final class BannersSecondViewServicesHandler: BannersSecondViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился BannersSecondViewServicesHandler")
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
    public func handleAction(_ state: BannersSecondViewServicesHandler.State) {
        switch state {
        // case .someState:
        //    someUIService?.update(with: nil, onTextChanged: nil)
        }
    }
    
    public func getViewFromServices() -> BannersSecondVC.ViewProperties {
         guard
             let bannersButtonService
         else { return .init() }
        return .init(
            buttonView: bannersButtonService.view
        )
    }
}
