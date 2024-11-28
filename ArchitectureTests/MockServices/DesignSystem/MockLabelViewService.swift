import Components
import Foundation
import DesignSystem
@testable import AbolArchitecture

class MockLabelViewService: LabelViewServiceProtocol {
    var view: LabelView = LabelView()
    var viewProperties: LabelView.ViewProperties = .init()
    var style: LabelViewStyle = .init(variant: .default(customColor: .Semantic.LightTheme.Content.Base.primary))

    var updatedText: NSAttributedString?

    func update(with parameters: LabelViewService.LabelUpdateParameters? = nil) {
        if let newText = parameters?.newText {
            updatedText = newText
        }
    }
}
