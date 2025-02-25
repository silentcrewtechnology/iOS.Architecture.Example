import Foundation
import Architecture
import DesignSystem

final class AuthFeature<VC: ViewProtocol>: FeatureProtocol {
    
    deinit {
        print("💀 удалился AuthFeature")
    }
    
    // MARK: Properties
    private var loginInputText: String = ""
    private var loginPasswordText: String = ""
    
    private var viewHandler: AuthViewServicesHandlerProtocol
    private var factory: AuthServiceFactoryProtocol
    private lazy var vc: VC = createViewClosure(viewProperties)
    
    private let createViewClosure: (VC.ViewProperties) -> VC
    private let viewProperties: VC.ViewProperties
    
    // MARK: Logic Services
    private var authValidationService: AuthValidationServiceProtocol?
    
    // MARK: Action
    enum Action {
        case tapButton
        case loginSuccess(String)
        case loginFailure
        case passwordFailure
        case loginUpdate(String)
        case passwordUpdate(String)
    }
    
    // MARK: Init
    init(
        viewProperties: VC.ViewProperties,
        factory: AuthServiceFactoryProtocol = AuthServiceFactory(),
        createViewClosure: @escaping (VC.ViewProperties) -> VC,
        viewHandler: AuthViewServicesHandlerProtocol = AuthViewServicesHandler()
    ) {
        self.viewProperties = viewProperties
        self.factory = factory
        self.createViewClosure = createViewClosure
        self.viewHandler = viewHandler
    }
    
    // MARK: Protocol methods
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any ViewProtocol)? {
        initialLogicServices()
        initialUIServices()
        return vc
    }
    
    func handleAction(_ action: Action) {
        switch action {
        case .tapButton:
            tapButtonAction()
        case .loginSuccess(let text):
            runNewFlow?(AuthFlow.tabBar)
        case .loginFailure:
            viewHandler.handleAction(.errorLogin)
        case .passwordFailure:
            viewHandler.handleAction(.errorPassword)
        case .loginUpdate(let text):
            loginInputText = text
            viewHandler.handleAction(.clearLogin)
        case .passwordUpdate(let text):
            loginPasswordText = text
            viewHandler.handleAction(.clearPassword)
        }
    }
    
    // MARK: Private
    private func initialLogicServices() {
        authValidationService = factory.setupValidationService()
    }
    
    private func initialUIServices() {
        let loginInputService = factory.setupLoginInputService(onTextChange: { [weak self] text in
            guard let self = self,
                  let text = text else { return }
            self.handleAction(.loginUpdate(text))
        })
        
        let passwordInputService = factory.setupPasswordInputService(onTextChange: { [weak self] text in
            guard let self = self,
                  let text = text else { return }
            handleAction(.passwordUpdate(text))
        })
        
        let buttonService = factory.setupButtonService(onTap: { [weak self] in
            guard let self else { return }
            handleAction(.tapButton)
        })
        
        viewHandler.setServices(
            logoImageService: factory.setupLogoImageService(),
            loginLabelService: factory.setupLoginLabelService(),
            loginInputService: loginInputService,
            passwordLabelService: factory.setupPasswordLabelService(),
            passwordInputService: passwordInputService,
            buttonService: buttonService
        )
        
        if let viewProperties = viewHandler.getViewServices() as? VC.ViewProperties {
            // Если нужно дополнить или исправить viewProperties,
            // то делаем это здесь
            vc.update(with: viewProperties)
        }
    }
}

// MARK: Private methods
extension AuthFeature {
    private func tapButtonAction() {
        viewHandler.handleAction(.startVarification)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self else { return }
            
            self.viewHandler.handleAction(.endVarification)
            
            let isValidLogin = authValidationService?.validationLogin(login: loginInputText) ?? false
            let isValidPassword = authValidationService?.validationPassword(password: loginPasswordText) ?? false
            
            if !isValidLogin {
                handleAction(.loginFailure)
                return
            }
            
            if !isValidPassword {
                handleAction(.passwordFailure)
                return
            }
            
            self.handleAction(.loginSuccess(loginInputText))
        }
    }
}
