//
//  StartViewServicesHandler.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 18.02.2025.
//

protocol StartViewServicesHandlerProtocol {
    func handleAction(_ state: StartViewServicesHandler.State)
}

public class StartViewServicesHandler: StartViewServicesHandlerProtocol {
    // MARK: UI
   // private var someService: SomeServiceProtocol?
    
    // MARK: Init
    func setServices(
       // someService: SomeServiceProtocol
    ) {
       // self.someService = someService
    }
    
    public enum State {
        
    }
    
    // MARK: Logic
    public func handleAction(_ state: StartViewServicesHandler.State) {
       // switch state {
       // }
    }
    
    public func getViewServices() -> StartVC.ViewProperties {
       // guard
       //     let someService
       // else { return .init() }
        return .init(
           // someView: someService.view
        )
    }
}
