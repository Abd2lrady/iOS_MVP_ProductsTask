//
//  ProductsListCoordinator.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class ProductsListCoordinator {
    var childCoordinators = [CoordinatorProtocol]()
    
    var parentCoordinator: CoordinatorProtocol?
    
    var router: RouterProtocol
    
    init(parentCoordinator: CoordinatorProtocol, router: Router) {
        self.parentCoordinator = parentCoordinator
        self.router = router
    }
}

extension ProductsListCoordinator: CoordinatorProtocol {
    
    func start() {
        let productsListVC = ProductsListVC()
        productsListVC.coordinator = self
        let productsListPresenter = ProductsListPresenter(view: productsListVC)
        productsListVC.presenter = productsListPresenter
        
        productsListVC.title = ScreenTitles.productList
        
        router.push(view: productsListVC,
                    animated: true)
        
    }
}

extension ProductsListCoordinator: ProductsListCoordinatorProtocol {
    func productSelected(index: Int) {
         
    }
    
    
}
