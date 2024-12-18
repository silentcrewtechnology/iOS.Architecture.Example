//@testable import AbolArchitecture

final class MockAuthValidationService: AuthValidationServiceProtocol {
    var mockLoginResult: Bool = false
    var mockPasswordResult: Bool = false
    
    func validationLogin(login: String) -> Bool {
        return mockLoginResult
    }
    
    func validationPassword(password: String) -> Bool {
        return mockPasswordResult
    }
}
