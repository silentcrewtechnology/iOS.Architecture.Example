//
//  ProfileFeature.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//
import Architecture
import Foundation

final class ProfileFeature: FeatureCoordinatorProtocol {
    
    private let profileVCBuilder: ProfileVCBuilder
    
    init(
        profileVCBuilder: ProfileVCBuilder
    ) {
        self.profileVCBuilder = profileVCBuilder
    }
   
    var runNewFlow: ((Any) -> Void)?
    
    func runFlow(data: Any?) -> (any BuilderProtocol)? {
        profileVCBuilder.view.setTabBar(with: .profile)
        return profileVCBuilder
    }
}
