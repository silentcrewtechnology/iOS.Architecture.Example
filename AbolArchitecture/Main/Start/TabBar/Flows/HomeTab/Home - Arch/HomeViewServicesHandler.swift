import Architecture
import DesignSystem

protocol HomeViewServicesHandlerProtocol {
    
    func setServices(
        logoImageService: ImageViewServiceProtocol,
        loginLabelService: LabelViewServiceProtocol,
        loginInputService: InputViewServiceProtocol,
        passwordLabelService: LabelViewServiceProtocol,
        passwordInputService: InputViewServiceProtocol,
        buttonService: ButtonViewServiceProtocol
    )
    
    func getViewServices() -> HomeVC.ViewProperties
    
    func handleAction(_ state: HomeViewServicesHandler.State)
}

public class HomeViewServicesHandler: HomeViewServicesHandlerProtocol {
    
    // MARK: UI
    private var logoImageService: ImageViewServiceProtocol?
    private var loginLabelService: LabelViewServiceProtocol?
    private var loginInputService: InputViewServiceProtocol?
    private var passwordLabelService: LabelViewServiceProtocol?
    private var passwordInputService: InputViewServiceProtocol?
    private var buttonService: ButtonViewServiceProtocol?
    
    // MARK: Init
    func setServices(
        logoImageService: ImageViewServiceProtocol,
        loginLabelService: LabelViewServiceProtocol,
        loginInputService: InputViewServiceProtocol,
        passwordLabelService: LabelViewServiceProtocol,
        passwordInputService: InputViewServiceProtocol,
        buttonService: ButtonViewServiceProtocol
    ) {
        self.logoImageService = logoImageService
        self.loginLabelService = loginLabelService
        self.loginInputService = loginInputService
        self.passwordLabelService = passwordLabelService
        self.passwordInputService = passwordInputService
        self.buttonService = buttonService
    }
    
    public enum State {
        case errorLogin
        case errorPassword
        case clearLogin
        case clearPassword
    }
    
    // MARK: Logic
    public func handleAction(_ state: HomeViewServicesHandler.State) {
        switch state {
        case .errorLogin:
            loginInputService?.update(with: .init(state: .error), onTextChanged: nil)
        case .errorPassword:
            passwordInputService?.update(with: .init(state: .error), onTextChanged: nil)
        case .clearLogin:
            passwordInputService?.update(with: .init(state: .default), onTextChanged: nil)
            loginInputService?.update(with: .init(state: .active), onTextChanged: nil)
        case .clearPassword:
            loginInputService?.update(with: .init(state: .default), onTextChanged: nil)
            passwordInputService?.update(with: .init(state: .active), onTextChanged: nil)
        }
    }
    
    public func getViewServices() -> HomeVC.ViewProperties {
        guard
            let logoImageService,
            let loginLabelService,
            let loginInputService,
            let passwordLabelService,
            let passwordInputService,
            let buttonService
        else { return .init() }
        return .init(
            logoView: logoImageService.view,
            loginLabelView: loginLabelService.view,
            loginInputView: loginInputService.view,
            passwordLabelView: passwordLabelService.view,
            passwordInputView: passwordInputService.view,
            buttonView: buttonService.view
        )
    }
}
