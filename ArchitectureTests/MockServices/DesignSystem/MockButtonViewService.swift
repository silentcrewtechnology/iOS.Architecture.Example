import Components
import DesignSystem
@testable import AbolArchitecture

class MockButtonViewService: ButtonViewServiceProtocol {
    
    var view: ButtonView = ButtonView()
    var viewProperties: ButtonView.ViewProperties
    var style: ButtonViewStyle
    var loaderService: LoaderViewService = .init(style: .init(color: .accent, size: .s))
    
    var lastUpdateParameters: ButtonViewService.ButtonUpdateParameters?
    
    required init(
        view: ButtonView = .init(),
        viewProperties: ButtonView.ViewProperties = .init(),
        style: ButtonViewStyle = .init(size: .large, color: .accent, variant: .primary, state: .default, icon: .without)
    ) {
        self.view = view
        self.viewProperties = viewProperties
        self.style = style
    }
    
    func update(with parameters: ButtonViewService.ButtonUpdateParameters? = nil) {
        if let newOnTap = parameters?.newOnTap {
            viewProperties.onTap = newOnTap
        }
        lastUpdateParameters = parameters
    }
}

