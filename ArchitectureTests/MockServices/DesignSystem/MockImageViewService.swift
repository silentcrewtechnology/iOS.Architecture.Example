import Components
import DesignSystem

final class MockImageViewService: ImageViewServiceProtocol {
    var view: ImageView = ImageView()
    var viewProperties: ImageView.ViewProperties = .init()
    var style: ImageViewStyle = .init(
        type: .letter("CJ".attributed),
        color: .additional1
    )
    
    func update(with parameters: LabelViewService.LabelUpdateParameters? = nil) {}
}
