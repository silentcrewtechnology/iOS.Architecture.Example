//
//  Dependency.swift
//  AbolArchitecture
//
//  Created by firdavs on 02.05.2024.
//

import Router
import Architecture
import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        application()
        simple()
        features()
        dificult()
        registerCoordinators()
        builders()
    }
    
    private static func registerCoordinators(){
        Resolver.register {
            FlowsCoordinator(
                startFlowCoordinator: Resolver.resolve(),
                tabBarFlowCoordinator: Resolver.resolve())
        }.implements(FlowsCoordinatorProtocol.self)
        
        Resolver.register {
            StartFlowCoordinator(
                routerService: Resolver.resolve(),
                tabBarFeature: Resolver.resolve(),
                startFeature: Resolver.resolve(),
                profileFeature: Resolver.resolve()
            )
        }.implements(RootCoordinatorProtocol.self)
        
        Resolver.register {
            TabBarFlowCoordinator()
        }.implements(CoordinatorProtocol.self)
    }
    
    private static func dificult(){
       
    }
    
    private static func simple(){
        Resolver.register {
            RouterService()
        }
    }
    
    private static func features() {
        Resolver.register {
            TabBarFeature()
        }.implements(FeatureCoordinatorProtocol.self)
        
        Resolver.register {
            StartFeature(
                startVCBuilder: Resolver.resolve(args: StartVC.ViewProperties())
            )
        }.implements(FeatureCoordinatorProtocol.self)
        
        Resolver.register {
            ProfileFeature(
                profileVCBuilder: Resolver.resolve(args: ProfileVC.ViewProperties())
            )
        }.implements(FeatureCoordinatorProtocol.self)
    }
    
    private static func application() {
        Resolver.register {
            RouterService()
        }
        .scope(.application)
    }
    
    private static func builders() {
        Resolver.register { (_, args) in
            StartVCBuilder(with: args())
        }
        
        Resolver.register { (_, args) in
            ProfileVCBuilder(with: args())
        }
    }
}


