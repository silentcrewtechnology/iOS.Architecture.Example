// 
//  NewAuthViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 28.02.2025.
//

import Architecture
import DesignSystem

protocol NewAuthViewServicesHandlerProtocol {
    
    func setServices(
        imageViewServiceService: ImageViewServiceProtocol?,
        inputAddCardViewService: InputViewService?,
        buttonViewService: ButtonViewServiceProtocol?,
        scanButtonVuewService: ButtonViewServiceProtocol?
    )
    
    func getViewFromServices() -> NewAuthVC.ViewProperties
    
    func handleAction(_ state: NewAuthViewServicesHandler.State)
}

public final class NewAuthViewServicesHandler: NewAuthViewServicesHandlerProtocol {
    
    deinit {
        print("💀 удалился NewAuthViewServicesHandler")
    }
    
    // MARK: UI
    // private var someUIService: SomeUIServiceProtocol?
    
    private var imageViewServiceService: ImageViewServiceProtocol?
    private var inputAddCardViewService: InputViewService?
    private var buttonViewService: ButtonViewServiceProtocol?
    private var scanButtonVuewService: ButtonViewServiceProtocol?
    
    // MARK: Init
    func setServices(
        imageViewServiceService: ImageViewServiceProtocol?,
        inputAddCardViewService: InputViewService?,
        buttonViewService: ButtonViewServiceProtocol?,
        scanButtonVuewService: ButtonViewServiceProtocol?
    ) {
         self.imageViewServiceService = imageViewServiceService
        self.inputAddCardViewService = inputAddCardViewService
        self.buttonViewService = buttonViewService
        self.scanButtonVuewService = scanButtonVuewService
    }
    
    public enum State {
        // Здесь описываются состояния вью
        // case someState
    }
    
    // MARK: Protocol
    public func handleAction(_ state: NewAuthViewServicesHandler.State) {
        switch state {
        // case .someState:
        //    someUIService?.update(with: nil, onTextChanged: nil)
        }
    }
    
    public func getViewFromServices() -> NewAuthVC.ViewProperties {
         guard
             let imageViewServiceService,
             let inputAddCardViewService,
             let buttonViewService,
             let scanButtonVuewService
         else { return .init() }
        return .init(
            imageView: imageViewServiceService.view,
            inputAddCardView: inputAddCardViewService.view,
            buttonView: buttonViewService.view,
            scanButtonView: scanButtonVuewService.view
        )
    }
}
