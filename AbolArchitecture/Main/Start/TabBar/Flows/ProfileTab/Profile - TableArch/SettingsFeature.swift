
import Architecture
import ArchitectureTableView
import DesignSystem

final class SettingsFeature: FeatureProtocol {
    
    // MARK: Properties
    
    var runNewFlow: ((Any) -> Void)?
    
    // MARK: Private properties
    
    private var tableViewVCBuilder: TableViewVCBuilder
    private var tableViewBuilder: TableViewBuilder
    private var tableDataSource: TableDataSource
    private var tableDelegate: TableDelegate
    private var sectionModelService: SectionRowModelService
    private let navigationBarViewPropertiesService: NavigationBarViewPropertiesService
    
    init(
        tableDataSource: TableDataSource = .init(),
        tableDelegate: TableDelegate = .init(),
        sectionModelService: SectionRowModelService = SectionRowModelService(),
        navigationBarViewPropertiesService: NavigationBarViewPropertiesService = .init()
    ) {
        self.tableDataSource = tableDataSource
        self.tableDelegate = tableDelegate
        self.sectionModelService = sectionModelService
        self.navigationBarViewPropertiesService = navigationBarViewPropertiesService
        
        tableViewBuilder = .init(with: .init(
            backgroundColor: .white,
            dataSources: self.tableDataSource,
            delegate: self.tableDelegate
        ))
        tableViewVCBuilder = .init(with: .init(
            tableView: tableViewBuilder.view
        ))
    }
    
    // MARK: Methods
    
    func runFlow(data: Any?) -> (any Architecture.ViewProtocol)? {
        
        tableViewVCBuilder.viewUpdater.state = .updateViewProperties(.init(
            navigationBarViewProperties: navigationBarViewPropertiesService.createBasicVP(
                title: "Настройки"
            ),
            tableView: tableViewBuilder.view))
        
        createSections()
        return tableViewVCBuilder.view
    }
}

// MARK: Private methods

extension SettingsFeature {
    private func createSections() {
        let section = sectionModelService.createSection(
            from: createRowModels(),
            rowsHeight: 52
        )
        tableDelegate.update(with: [section])
        tableDataSource.update(with: [section])
    }
    
    private func createRowModels() -> [DSRowModel] {
        var rowModels = [DSRowModel]()
        
        for item in SettingsItems.allCases {
            rowModels.append(
                .init(
                    leading: .atom(.title(item.rawValue, nil, nil)),
                    didTap: { [weak self] tableView, indexPath in
                        tableView.deselectRow(at: indexPath, animated: true)
                        self?.runNewFlow?(item)
                    }
                )
            )
        }
        
        return rowModels
    }
}
