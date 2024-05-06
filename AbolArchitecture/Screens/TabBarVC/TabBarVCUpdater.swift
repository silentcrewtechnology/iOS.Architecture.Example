//
//  TabBarVCUpdater.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Foundation
import Architecture

final class TabBarVCUpdater: Updater<TabBarVC> {
    
    var viewProperties: TabBarVC.ViewProperties
    
    //MARK: - Main state view model
    enum State {
        case setSelectedIndex(Int)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .setSelectedIndex(let selectedIndex):
                self.viewProperties.selectedIndex = selectedIndex
                self.update?(self.viewProperties)
        }
    }
    
    override init(
        viewProperties: TabBarVC.ViewProperties
    ) {
        self.viewProperties = viewProperties
        super.init(viewProperties: viewProperties)
    }
}
