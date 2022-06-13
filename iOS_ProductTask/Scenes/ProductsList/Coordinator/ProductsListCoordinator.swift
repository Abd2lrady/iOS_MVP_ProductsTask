//
//  ProductsListCoordinator.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

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
        productsListVC.title = ScreenTitles.productList
        let productService: ProductGateway = RemoteProductService()
        let productsListPresenter = ProductsListPresenter(view: productsListVC,
                                                          productService: productService)
        productsListVC.presenter = productsListPresenter
        

        router.push(view: productsListVC,
                    animated: true)
        
    }
}

extension ProductsListCoordinator: ProductsListCoordinatorProtocol {
    func navigateToProductDetails(for product: Product) {
        print(product)
        let view = ProductDetailsVC()
        print("navigate to porduct details")
        router.push(view: view, animated: true)
    }

    
}
