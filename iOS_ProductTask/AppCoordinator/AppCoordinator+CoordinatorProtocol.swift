//
//  AppCoordinator+CoordinatorProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension AppCoordinator: CoordinatorProtocol {
    
    func start() {
        
        let navigator = UINavigationController()
        let navigatorDelegate = TransitionDelegate()
        let router = Router(navigator: navigator, navigatorDelegate: navigatorDelegate)
        
        let productsListCoordinator = ProductsListCoordinator(parentCoordinator: self,
                                                              router: router)
        childCoordinators.append(productsListCoordinator)
        
        productsListCoordinator.start()
        
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
    
}
