import Foundation
import Architecture
import DesignSystem

// Заменить в Templates
final class HomeFeature<VC: ViewProtocol>: FeatureProtocol {
    
    deinit {
        print("💀 удалился HomeFeature")
    }
    
    private var loginInputText: String = ""
    private var loginPasswordText: String = ""
    
    private var viewHandler: HomeViewServicesHandlerProtocol
    private var factory: HomeServiceFactoryProtocol
    private var vc: VC?
    
    // MARK: Logic Services
    private var authValidationService: AuthValidationServiceProtocol?
    
    enum Action {
        case tapButton
        case loginSuccess(String)
        case loginFailure
        case passwordFailure
        case loginUpdate(String)
        case passwordUpdate(String)
    }
    
    init(
        viewProperties: HomeVC.ViewProperties = .init(),
        factory: HomeServiceFactoryProtocol = HomeServiceFactory(),
        viewHandler: HomeViewServicesHandlerProtocol = HomeViewServicesHandler()
    ) {
        self.vc = HomeVC(
            viewProperties: viewProperties
        ) as? VC
        self.factory = factory
        self.viewHandler = viewHandler
    }
    
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
            runNewFlow?(TabBarFlow.homeWelcome(text))
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
    
    private func initialLogicServices() {
        authValidationService = factory.setupValidationService()
    }
    
    private func initialUIServices() {
        let loginInputService = factory.setupLoginInputService(onTextChange: { [weak self] text in
            guard let self = self else { return }
            self.handleAction(.loginUpdate(text))
        })
        
        let passwordInputService = factory.setupPasswordInputService(onTextChange: { [weak self] text in
            guard let self = self else { return }
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
            vc?.update(with: viewProperties)
        }
    }
}

// MARK: Private methods
extension HomeFeature {
    private func tapButtonAction() {
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
