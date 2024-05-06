//
//  FlowsCoordinator.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import Foundation

struct FlowsCoordinator: FlowsCoordinatorProtocol {
    
    private let startFlowCoordinator: RootCoordinatorProtocol
    private let tabBarFlowCoordinator: CoordinatorProtocol
    
    public init(
        startFlowCoordinator: RootCoordinatorProtocol,
        tabBarFlowCoordinator: CoordinatorProtocol
    ) {
        self.startFlowCoordinator = startFlowCoordinator
        self.tabBarFlowCoordinator = tabBarFlowCoordinator
    }
    
    func setRoot() {
        startFlowCoordinator.setRoot()
    }
    
    func setupAllFlows() {
        startFlowCoordinator.setupFlow()
        tabBarFlowCoordinator.setupFlow()
    }
}
