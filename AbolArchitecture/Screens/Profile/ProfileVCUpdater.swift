//
//  ProfileVCUpdater.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Foundation
import Architecture

final class ProfileVCUpdater: Updater<ProfileVC> {
    
    var viewProperties: ProfileVC.ViewProperties
    
    //MARK: - Main state view model
    enum State {
       
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        
    }
    
    override init(
        viewProperties: ProfileVC.ViewProperties
    ) {
        self.viewProperties = viewProperties
        super.init(viewProperties: viewProperties)
    }
}
