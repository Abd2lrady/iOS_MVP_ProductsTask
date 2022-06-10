//
//  CoordinatorProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var parentCoordinator: CoordinatorProtocol? { get set }

    
    func start()
    func removeChild(coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {
    func removeChild(coordinator: CoordinatorProtocol) {
        for (index, child) in childCoordinators.enumerated() where coordinator === child {
                childCoordinators.remove(at: index)
            
        }
    }

}
