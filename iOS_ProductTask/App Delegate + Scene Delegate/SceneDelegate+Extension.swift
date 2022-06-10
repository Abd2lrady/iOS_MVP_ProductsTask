//
//  SceneDelegate+Extension.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension SceneDelegate {
    
    func setAppRootView(scene: UIWindowScene) {
        appCoordinator = AppCoordinator(windowScene: scene)
        appCoordinator?.start()
    }
    
}
