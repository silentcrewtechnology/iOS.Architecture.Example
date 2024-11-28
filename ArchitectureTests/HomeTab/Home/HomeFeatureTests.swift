import XCTest
@testable import AbolArchitecture

class HomeFeatureTests: XCTestCase {

    func testInputTextUpdatesLabelService() {
        // Arrange
        let mockLabelService = MockLabelViewService()
        let mockInputService = MockInputViewService()
        let homeFeature = HomeFeature(
            builder: HomeVCBuilder(with: HomeVC.ViewProperties()),
            inputService: mockInputService,
            labelService: mockLabelService
        )
        _ = homeFeature.runFlow(data: nil)

        // Act
        let testText = "Тестовое имя"
        mockInputService.simulateTextChange(text: testText)

        // Assert
        XCTAssertEqual(mockLabelService.updatedText?.string, testText)
    }

    func testButtonTapCallsRunNewFlow() {
        // Arrange
        let expectation = self.expectation(description: "runNewFlow called")
        let mockButtonService = MockButtonViewService()
        let mockInputService = MockInputViewService()
        let mockLabelService = MockLabelViewService()
        let homeFeature = HomeFeature(
            builder: HomeVCBuilder(with: HomeVC.ViewProperties()),
            buttonService: mockButtonService,
            inputService: mockInputService,
            labelService: mockLabelService
        )
        _ = homeFeature.runFlow(data: nil)
        
        homeFeature.runNewFlow = { data in
            if let flow = data as? TabBarFlow, case let .homeWelcome(name) = flow {
                XCTAssertEqual(name, "Тестовое имя")
                expectation.fulfill()
            }
        }
        
        // Act
        // Симулируем ввод текста
        mockInputService.simulateTextChange(text: "Тестовое имя")
        // Симулируем нажатие кнопки
        mockButtonService.viewProperties.onTap()
        
        // Assert
        waitForExpectations(timeout: 1, handler: nil)
    }

}
