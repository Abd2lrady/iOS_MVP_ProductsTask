//
//  Router.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class Router {
    
    let navigator: UINavigationController
    let navigatorDelegate: UINavigationControllerDelegate?
    init(navigator: UINavigationController,
         navigatorDelegate: UINavigationControllerDelegate?) {
        self.navigator = navigator
        self.navigatorDelegate = navigatorDelegate
        navigator.delegate = navigatorDelegate
    }
    
}
