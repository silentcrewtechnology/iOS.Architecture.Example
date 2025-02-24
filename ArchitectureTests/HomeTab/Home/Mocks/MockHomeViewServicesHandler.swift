//import DesignSystem
//
//final class MockHomeViewServicesHandler: HomeViewServicesHandlerProtocol {
//    
//    private(set) var recordedActions: [HomeViewServicesHandler.State] = []
//    
//    var viewProperties: HomeVC.ViewProperties = .init()
//    
//    // MARK: Init
//    func setServices(
//        logoImageService: ImageViewServiceProtocol,
//        loginLabelService: LabelViewServiceProtocol,
//        loginInputService: InputViewServiceProtocol,
//        passwordLabelService: LabelViewServiceProtocol,
//        passwordInputService: InputViewServiceProtocol,
//        buttonService: ButtonViewServiceProtocol
//    ) { }
//    
//    func clearRecordedActions() {
//        recordedActions.removeAll()
//    }
//    
//    func getViewServices() -> HomeVC.ViewProperties {
//        return viewProperties
//    }
//    
//    // MARK: Logic
//    func handleAction(_ state: HomeViewServicesHandler.State) {
//        switch state {
//        case .errorLogin:
//            recordedActions.append(.errorLogin)
//        case .errorPassword:
//            recordedActions.append(.errorPassword)
//        case .clearLogin:
//            recordedActions.append(.clearLogin)
//        case .clearPassword:
//            recordedActions.append(.clearPassword)
//        }
//    }
//}
