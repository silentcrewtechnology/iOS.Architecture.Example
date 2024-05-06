//
//  StartFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import UIKit

final class StartFeature: FeatureCoordinatorProtocol {
    
    private let startVCBuilder: StartVCBuilder
    
    init(
        startVCBuilder: StartVCBuilder
    ) {
        self.startVCBuilder = startVCBuilder
    }
   
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        openTabBar()
        return startVCBuilder
    }
    
    private func openTabBar() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.runNewFlow?(StartFlow.tabBar)
        }
    }
}


