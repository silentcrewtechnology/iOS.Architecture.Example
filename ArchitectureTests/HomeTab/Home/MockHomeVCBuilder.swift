
import Architecture
@testable import AbolArchitecture

class MockHomeVCBuilder: BuilderProtocol {
    typealias V = HomeVC
    typealias U = HomeVCUpdater

    var view: HomeVC
    var viewUpdater: HomeVCUpdater

    required init(with viewProperties: HomeVC.ViewProperties = HomeVC.ViewProperties()) {
        self.view = HomeVC(viewProperties: viewProperties)
        self.viewUpdater = HomeVCUpdater(
            viewProperties: viewProperties,
            update: view.update
        )
    }
}
