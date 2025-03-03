// 
//  HomeViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 02.03.2025.
//

import Architecture
import DesignSystem

protocol HomeViewServicesHandlerProtocol {
    
    func setServices(
        secondScreenButtonService: ButtonViewServiceProtocol
    )
    
    func getViewFromServices() -> HomeVC.ViewProperties
    
    func handleAction(_ state: HomeViewServicesHandler.State)
}

public final class HomeViewServicesHandler: HomeViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился HomeViewServicesHandler")
    }
    
    // MARK: UI
     private var secondScreenButtonService: ButtonViewServiceProtocol?
    
    // MARK: Init
    func setServices(
        secondScreenButtonService: ButtonViewServiceProtocol
    ) {
         self.secondScreenButtonService = secondScreenButtonService
    }
    
    public enum State {
        // Здесь описываются состояния вью
        // case someState
    }
    
    // MARK: Protocol
    public func handleAction(_ state: HomeViewServicesHandler.State) {
        switch state {
        // case .someState:
        //    someUIService?.update(with: nil, onTextChanged: nil)
        }
    }
    
    public func getViewFromServices() -> HomeVC.ViewProperties {
         guard
             let secondScreenButtonService
         else { return .init() }
        return .init(
            buttonView: secondScreenButtonService.view
        )
    }
}
