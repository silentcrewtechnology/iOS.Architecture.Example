// 
//  WelcomeVCUpdater.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 26.11.2024.
//

import Foundation
import Architecture

final class WelcomeVCUpdater: ViewUpdater<WelcomeVC> {
    
    deinit {
        print("💀 удалился WelcomeScreenUpdater")
    }
    
    var viewProperties: WelcomeVC.ViewProperties
    
    enum State {
        // Здесь описываются состояния вью
        case initial(WelcomeVC.ViewProperties)
    }
    
    // Заменить в Templates
    func handle(_ state: State) {
        switch state {
        case .initial(let properties):
            update(properties)
        }
    }
    
    override init(
        viewProperties: WelcomeVC.ViewProperties,
        update: @escaping Closure<WelcomeVC.ViewProperties>
    ) {
        self.viewProperties = viewProperties
        super.init(
            viewProperties: viewProperties,
            update: update
        )
    }
}
