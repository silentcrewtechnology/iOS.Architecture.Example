//
//  StartVCUpdater.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Foundation
import Architecture

final class StartVCUpdater: Updater<StartVC> {
    
    var viewProperties: StartVC.ViewProperties
    
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
                self.update?(self.viewProperties)
        }
    }
    
    override init(
        viewProperties: StartVC.ViewProperties
    ) {
        self.viewProperties = viewProperties
        super.init(viewProperties: viewProperties)
    }
}
