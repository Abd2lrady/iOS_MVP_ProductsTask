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
        let router = Router(navigator: navigator)
        let viewController = ProductsListVC()
        
        router.push(view: viewController, animated: true)

        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
    
}
