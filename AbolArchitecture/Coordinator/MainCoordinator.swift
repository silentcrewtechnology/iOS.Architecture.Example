//
//  FlowsCoordinator.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import Foundation
import ArchitectureTableView

struct MainCoordinator: MainCoordinatorProtocol {
    private let startFlowCoordinator: StartFlowCoordinator
    private let tabBarFlowCoordinator: CoordinatorProtocol
    private let textFieldFlowCoordinator: CoordinatorProtocol
    
    public init(
        startFlowCoordinator: StartFlowCoordinator,
        tabBarFlowCoordinator: TabBarFlowCoordinator,
        textFieldFlowCoordinator: TextFieldFlowCoordinator
    ) {
        self.startFlowCoordinator = startFlowCoordinator
        self.tabBarFlowCoordinator = tabBarFlowCoordinator
        self.textFieldFlowCoordinator = textFieldFlowCoordinator
    }
    
    func setRoot() {
        startFlowCoordinator.setRoot()
    }
    
    func setupCoordinatorsFlow() {
        startFlowCoordinator.setupFlow(completion: { _ in
            tabBarFlowCoordinator.startFlow()
        })
        
        tabBarFlowCoordinator.setupFlow(completion: { flow in
            switch flow as? MainFlow {
            case .textField:
                textFieldFlowCoordinator.startFlow()
            default:
                break
            }
        })
    }
}
