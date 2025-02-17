import UIKit
import DesignSystem

protocol HomeServiceFactoryProtocol {
    func setupLogoImageService() -> ImageViewServiceProtocol
    func setupLoginLabelService() -> LabelViewServiceProtocol
    func setupLoginInputService(onTextChange: ((String?) -> Void)?) -> InputViewServiceProtocol
    func setupPasswordLabelService() -> LabelViewServiceProtocol
    func setupPasswordInputService(onTextChange: ((String?) -> Void)?) -> InputViewServiceProtocol
    func setupButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    func setupValidationService() -> AuthValidationServiceProtocol
}

final class HomeServiceFactory: HomeServiceFactoryProtocol {
    
    // MARK: Logo
    func setupLogoImageService() -> ImageViewServiceProtocol {
        let logo = UIImage(named: "crab") ?? UIImage()
        let logoImageService = ImageViewService(
            style: .init(
                type: .fillImage(logo),
                color: .primary
            )
        )
        logoImageService.update(with: nil)
        return logoImageService
    }
    
    // MARK: Login
    func setupLoginLabelService() -> LabelViewServiceProtocol {
        let loginLabelService = LabelViewService(
            viewProperties: .init(text: "Введите логин".attributed),
            style: .init(variant: .default(customColor: .Semantic.LightTheme.Content.Base.primary))
        )
        loginLabelService.update(with: nil)
        return loginLabelService
    }
    
    func setupLoginInputService(onTextChange: ((String?) -> Void)?) -> InputViewServiceProtocol {
        let loginInputService = InputViewService(
            viewProperties: .init(
                textFieldViewProperties: .init(
                    text: .init(string: ""),
                    placeholder: .init(string: "Твой логин")
                ),
                stackViewInsets: .init(inset: 0),
                onTextChanged: onTextChange
            ),
            style: .init(state: .`default`, set: .simple)
        )
        loginInputService.update(with: nil)
        
        return loginInputService
    }
    
    // MARK: Password
    func setupPasswordLabelService() -> LabelViewServiceProtocol {
        let passwordLabelService = LabelViewService(
            viewProperties: .init(text: "Введите пароль".attributed),
            style: .init(variant: .default(customColor: .Semantic.LightTheme.Content.Base.primary))
        )
        passwordLabelService.update(with: nil)
        return passwordLabelService
        
    }
    
    func setupPasswordInputService(onTextChange: ((String?) -> Void)?) -> InputViewServiceProtocol {
        let passwordInputService = InputViewService(
            viewProperties: .init(
                textFieldViewProperties: .init(
                    text: .init(string: ""),
                    placeholder: .init(string: "Твой пароль")
                ),
                stackViewInsets: .init(inset: 0),
                onTextChanged: onTextChange
            ),
            style: .init(state: .`default`, set: .simple)
        )
        passwordInputService.update(with: nil)
        return passwordInputService
    }
    
    // MARK: Button
    func setupButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: "Вход".attributed
            ),
            style: .init(
                size: .large,
                color: .light,
                variant: .primary,
                state: .default,
                icon: .without
            )
        )
        buttonService.update(with: ButtonViewService.ButtonUpdateParameters(
            newOnTap: onTap
        ))
        return buttonService
    }
    
    // MARK: Validation
    func setupValidationService() -> AuthValidationServiceProtocol {
        return AuthValidationService()
    }
}
