import XCTest
@testable import AbolArchitecture

final class AuthValidationServiceTests: XCTestCase {
    
    var service: AuthValidationService!
    
    override func setUp() {
        super.setUp()
        service = AuthValidationService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testValidationLogin_withCorrectLogin_shouldReturnTrue() {
        // Given
        let correctLogin = "Admin"
        
        // When
        let result = service.validationLogin(login: correctLogin)
        
        // Then
        XCTAssertTrue(result, "Ожидается, что при правильном логине вернётся true")
    }
    
    func testValidationLogin_withWrongLogin_shouldReturnFalse() {
        // Given
        let wrongLogin = "NotAdmin"
        
        // When
        let result = service.validationLogin(login: wrongLogin)
        
        // Then
        XCTAssertFalse(result, "Ожидается, что при неправильном логине вернётся false")
    }
    
    func testValidationPassword_withCorrectPassword_shouldReturnTrue() {
        // Given
        let correctPassword = "123"
        
        // When
        let result = service.validationPassword(password: correctPassword)
        
        // Then
        XCTAssertTrue(result, "Ожидается, что при правильном пароле вернётся true")
    }
    
    func testValidationPassword_withWrongPassword_shouldReturnFalse() {
        // Given
        let wrongPassword = "456"
        
        // When
        let result = service.validationPassword(password: wrongPassword)
        
        // Then
        XCTAssertFalse(result, "Ожидается, что при неправильном пароле вернётся false")
    }
}
