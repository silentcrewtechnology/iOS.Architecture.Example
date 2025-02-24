//import Components
//import DesignSystem
//@testable import AbolArchitecture
//
//final class MockHomeServiceFactory: HomeServiceFactoryProtocol {
//    var mockAuthValidationService: MockAuthValidationService?
//    
//    func setupLogoImageService() -> ImageViewServiceProtocol {
//        return MockImageViewService()
//    }
//    
//    func setupLoginLabelService() -> LabelViewServiceProtocol {
//        return MockLabelViewService()
//    }
//    
//    func setupLoginInputService(onTextChange: ((String) -> Void)?) -> InputViewServiceProtocol {
//        return MockInputViewService(onTextChange: onTextChange)
//    }
//    
//    func setupPasswordLabelService() -> LabelViewServiceProtocol {
//        return MockLabelViewService()
//    }
//    
//    func setupPasswordInputService(onTextChange: ((String) -> Void)?) -> InputViewServiceProtocol {
//        return MockInputViewService(onTextChange: onTextChange)
//    }
//    
//    func setupButtonService(onTap: (() -> Void)?) -> ButtonViewServiceProtocol {
//        let tap = onTap ?? { }
//        return MockButtonViewService(viewProperties: .init(onTap: tap))
//    }
//    
//    func setupValidationService() -> AuthValidationServiceProtocol {
//        return mockAuthValidationService ?? MockAuthValidationService()
//    }
//}
