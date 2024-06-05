//
//  TextFieldVCUpdater.swift
//  AbolArchitecture
//
//  Created by firdavs on 05.06.2024.
//

import ArchitectureTableView
import Foundation
import Architecture

final class TextFieldVCUpdater: ViewUpdater<TextFieldVC> {
    
    var viewProperties: TextFieldVC.ViewProperties
    
    //MARK: - Main state view model
    enum State {
       case upateLabel(NSAttributedString)
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
        case .upateLabel(let labelText):
            self.viewProperties.labelText = labelText
            update(self.viewProperties)
        }
       
    }
    
    override init(
        viewProperties: TextFieldVC.ViewProperties,
        update: @escaping Closure<TextFieldVC.ViewProperties>
    ) {
        self.viewProperties = viewProperties
        super.init(
            viewProperties: viewProperties,
            update: update
        )
    }
}

