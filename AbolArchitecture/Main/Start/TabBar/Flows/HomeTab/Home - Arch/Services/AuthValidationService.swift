protocol AuthValidationServiceProtocol {
    func validationLogin(login: String) -> Bool
    func validationPassword(password: String) -> Bool
}

final class AuthValidationService: AuthValidationServiceProtocol {
    
    let trueLogin = "Admin"
    let truePassword = "123"
    
    func validationLogin(login: String) -> Bool {
        login == trueLogin
    }
    
    func validationPassword(password: String) -> Bool {
        password == truePassword
    }
}
