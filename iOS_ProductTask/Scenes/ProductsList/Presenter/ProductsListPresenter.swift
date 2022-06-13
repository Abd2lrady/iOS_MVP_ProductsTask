//
//  ProductsListPresenter.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class ProductsListPresenter {
    weak var view: ProductsListViewProtocol?
    let productService: ProductGateway
    var products = [Product]()
        
    init(view: ProductsListViewProtocol,
         productService: ProductGateway) {
        self.view = view
        self.productService = productService
    }
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
        
    func viewLoaded() {
        productService.getProducts { [weak self] result in
            switch result {
            case .failure(let error):
                switch error {
                case .network(let error):
                    print("catched network error")
                    self?.view?.getError(error: error)
                    print(error)
                case .parse(let error):
                    print("catched parse error")
                    print(error)
                }
            case .success(let products):
                self?.products = products
                self?.view?.productsFetched()
            }
        }
    }
    
    
}
