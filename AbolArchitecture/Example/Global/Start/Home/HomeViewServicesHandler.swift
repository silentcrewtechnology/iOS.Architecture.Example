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
        secondScreenButtonService: ButtonViewServiceProtocol,
        titleViewService: TitleViewServiceProtocol
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
    private var titleViewService: TitleViewServiceProtocol?
    
    // MARK: Init
    func setServices(
        secondScreenButtonService: ButtonViewServiceProtocol,
        titleViewService: TitleViewServiceProtocol
    ) {
         self.secondScreenButtonService = secondScreenButtonService
        self.titleViewService = titleViewService
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
             let secondScreenButtonService,
             let titleViewService
         else { return .init() }
        return .init(
            titleNameView: titleViewService.view,
            buttonView: secondScreenButtonService.view
        )
    }
}
