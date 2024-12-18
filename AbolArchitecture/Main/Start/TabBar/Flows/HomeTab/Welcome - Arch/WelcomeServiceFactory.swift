import DesignSystem

protocol WelcomeServiceFactoryProtocol {
    func setupLabelService(name: String) -> LabelViewServiceProtocol
    func setupFlowOneButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
    func setupFlowTwoButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol
}

final class WelcomeServiceFactory: WelcomeServiceFactoryProtocol {
    
    // MARK: Label
    func setupLabelService(name: String) -> LabelViewServiceProtocol {
        let loginLabelService = LabelViewService(
            viewProperties: .init(text: "Привет, \(name)!".attributed),
            style: .init(variant: .default(customColor: .Semantic.DarkTheme.Content.Base.primary),
                         alignment: .center)
        )
        loginLabelService.update(with: nil)
        return loginLabelService
    }
    
    // MARK: Buttons
    func setupFlowOneButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: "Flow One".attributed
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
    
    func setupFlowTwoButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
        let buttonService = ButtonViewService(
            viewProperties: .init(
                attributedText: "Flow Two".attributed
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
}
