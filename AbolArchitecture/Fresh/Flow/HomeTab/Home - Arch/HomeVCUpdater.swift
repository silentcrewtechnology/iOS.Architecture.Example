// 
//  HomeVCUpdater.swift
//  AbolArchitecture
//
//  Created by Валерий Васин on 14.11.2024.
//

import Foundation
import Architecture

final class HomeVCUpdater: ViewUpdater<HomeVC> {
    
    deinit {
        print("💀 удалился HomeScreenUpdater")
    }
    
    var viewProperties: HomeVC.ViewProperties
    
    enum State {
        // Здесь описываются состояния вью
        case initial(HomeVC.ViewProperties)
//        case updateLabelText(String)
    }
    
    // Заменить в Templates
    func handle(_ state: State) {
        switch state {
        case .initial(let properties):
            update(properties)
//        case .updateLabelText(let newText):
//            viewProperties.labelView.
        }
    }
    
    
//    public var state: State? {
//        didSet { self.stateManager() }
//    }
    // Заменить в Templates
//    private func stateManager(){
//        guard let state = self.state else { return }
//        
//        switch state {
//            // Здесь обрабатываем изменения состояния
//            // Должены меняться поля у viewProperties
//        }
//        
//        update(self.viewProperties)
//    }
    
    override init(
        viewProperties: HomeVC.ViewProperties,
        update: @escaping Closure<HomeVC.ViewProperties>
    ) {
        self.viewProperties = viewProperties
        super.init(
            viewProperties: viewProperties,
            update: update
        )
    }
}
