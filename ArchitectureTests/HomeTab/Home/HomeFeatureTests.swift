import XCTest
@testable import AbolArchitecture

final class HomeFeatureTests: XCTestCase {
    
    var feature: HomeFeature<MockHomeVC>!
    var factory: MockHomeServiceFactory!
    var viewHandler: MockHomeViewServicesHandler!
    var authService: MockAuthValidationService!
    
    override func setUp() {
        super.setUp()
        authService = MockAuthValidationService()
        factory = MockHomeServiceFactory()
        viewHandler = MockHomeViewServicesHandler()
        feature = HomeFeature<MockHomeVC>(
            factory: factory,
            viewHandler: viewHandler
        )
    }
    
    override func tearDown() {
        feature = nil
        factory = nil
        authService = nil
        super.tearDown()
    }
    
    func testInputLoginLabelService() {
        // Arrange
        let testText = "Тестовое имя"
        // Act
        feature.handleAction(.loginUpdate(testText))
        let isHandlerChanged = viewHandler.recordedActions.contains(.clearLogin)
        // Assert
        XCTAssertEqual(isHandlerChanged, true)
        // After
        viewHandler.clearRecordedActions()
    }
    
    func testInputPasswordLabelService() {
        // Arrange
        let passwordText = "Тестовый пароль"
        // Act
        feature.handleAction(.passwordUpdate(passwordText))
        let isHandlerChanged = viewHandler.recordedActions.contains(.clearPassword)
        // Assert
        XCTAssertEqual(isHandlerChanged, true)
        // After
        viewHandler.clearRecordedActions()
    }
}

import Architecture

final class MockHomeVC: ViewProtocol {
    
    var viewProperties: HomeVC.ViewProperties
    
    init(viewProperties: HomeVC.ViewProperties) {
        self.viewProperties = viewProperties
    }
    
    func update(with viewProperties: HomeVC.ViewProperties) {
        
    }
}




//    func testInputTextUpdatesLabelService() {
//        // Arrange
//        let mockLabelService = MockLabelViewService()
//        let mockInputService = MockInputViewService()
//        let homeFeature = HomeFeature(
//            builder: HomeVCBuilder(with: HomeVC.ViewProperties()),
//            inputService: mockInputService,
//            labelService: mockLabelService
//        )
//        _ = homeFeature.runFlow(data: nil)
//
//        // Act
//        let testText = "Тестовое имя"
//        mockInputService.simulateTextChange(text: testText)
//
//        // Assert
//        XCTAssertEqual(mockLabelService.updatedText?.string, testText)
//    }
//
//    func testButtonTapCallsRunNewFlow() {
//        // Arrange
//        let expectation = self.expectation(description: "runNewFlow called")
//        let mockButtonService = MockButtonViewService()
//        let mockInputService = MockInputViewService()
//        let mockLabelService = MockLabelViewService()
//        let homeFeature = HomeFeature(
//            builder: HomeVCBuilder(with: HomeVC.ViewProperties()),
//            buttonService: mockButtonService,
//            inputService: mockInputService,
//            labelService: mockLabelService
//        )
//        _ = homeFeature.runFlow(data: nil)
//
//        homeFeature.runNewFlow = { data in
//            if let flow = data as? TabBarFlow, case let .homeWelcome(name) = flow {
//                XCTAssertEqual(name, "Тестовое имя")
//                expectation.fulfill()
//            }
//        }
//
//        // Act
//        // Симулируем ввод текста
//        mockInputService.simulateTextChange(text: "Тестовое имя")
//        // Симулируем нажатие кнопки
//        mockButtonService.viewProperties.onTap()
//
//        // Assert
//        waitForExpectations(timeout: 1, handler: nil)
//    }

//}
