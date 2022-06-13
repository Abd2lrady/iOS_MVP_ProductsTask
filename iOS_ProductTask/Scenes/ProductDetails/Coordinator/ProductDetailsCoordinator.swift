//
//  ProductDetailsCoordinator.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class ProductDetailsCoordinator {
    var parentCoordinator: CoordinatorProtocol?
    var childCoordinators = [CoordinatorProtocol]()
    let router: RouterProtocol
    let product: Product

    init(parentCoordinator: CoordinatorProtocol, router: RouterProtocol, product: Product) {
        self.parentCoordinator = parentCoordinator
        self.router = router
        self.product = product
    }
}

extension ProductDetailsCoordinator: CoordinatorProtocol {

    func start() {
        let view = ProductDetailsVC()
        let presenter = ProductDetailsPresenter(view: view, product: product)
        view.presenter = presenter
        view.backButtonTapped = backToProductsList
        router.push(view: view, animated: true)
    }
    
    func backToProductsList() {
        router.pop(animated: true)
        parentCoordinator?.removeChild(coordinator: self)
    }
    
}
