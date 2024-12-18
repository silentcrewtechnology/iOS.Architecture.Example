import Components
import DesignSystem
@testable import AbolArchitecture

final class MockInputViewService: InputViewServiceProtocol {
    var view: InputView = InputView()
    var viewProperties: InputView.ViewProperties
    var style: InputViewStyle
    var onTextChange: ((String) -> Void)?

    required init(
        view: InputView = .init(),
        viewProperties: InputView.ViewProperties = .init(),
        style: InputViewStyle = .init(state: .active, set: .simple),
        onTextChange: ((String) -> Void)? = nil
    ) {
        self.viewProperties = viewProperties
        self.style = style
        self.onTextChange = onTextChange
    }

    func simulateTextChange(text: String) {
        onTextChange?(text)
    }

    func update(with parameters: InputViewService.InputUpdateParameters? = nil) {
        // Реализация не нужна для этого теста
    }
}
