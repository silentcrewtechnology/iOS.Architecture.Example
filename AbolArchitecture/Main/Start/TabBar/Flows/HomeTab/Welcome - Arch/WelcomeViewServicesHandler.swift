import Architecture
import DesignSystem

protocol WelcomeViewServicesHandlerProtocol {
    init(
        labelService: LabelViewServiceProtocol,
        buttonFlowOneService: ButtonViewServiceProtocol,
        buttonFlowTwoService: ButtonViewServiceProtocol
    )
    
    func handleAction(_ state: WelcomeViewServicesHandler.State)
    
    func getViewServices() -> WelcomeVC.ViewProperties
}

final class WelcomeViewServicesHandler: WelcomeViewServicesHandlerProtocol {
    
    // MARK: UI
    private var labelService: LabelViewServiceProtocol
    private var buttonFlowOneService: ButtonViewServiceProtocol
    private var buttonFlowTwoService: ButtonViewServiceProtocol
    
    // MARK: Logic
    required init(
        labelService: LabelViewServiceProtocol,
        buttonFlowOneService: ButtonViewServiceProtocol,
        buttonFlowTwoService: ButtonViewServiceProtocol
    ) {
        self.labelService = labelService
        self.buttonFlowOneService = buttonFlowOneService
        self.buttonFlowTwoService = buttonFlowTwoService
    }
    
    public enum State {
        
    }
    
    public func handleAction(_ state: WelcomeViewServicesHandler.State) {
    }
    
    public func getViewServices() -> WelcomeVC.ViewProperties {
        .init(
            labelView: labelService.view,
            flowOneButtonView: buttonFlowOneService.view,
            flowTwoButtonView: buttonFlowTwoService.view
        )
    }
}
