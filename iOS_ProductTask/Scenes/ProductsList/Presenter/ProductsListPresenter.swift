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
    func productSelected(at index: Int) {
        view?.navigateToProductDetails(for: products[index])
    }
    
    func loadMore() {
        loadProducts()
    }
    
        
    func viewLoaded() {
        loadProducts()
    }
    
    private func loadProducts() {
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
                case .unknown(let error):
                    print("catched unknown error")
                    print(error)
                }
            case .success(let products):
                self?.products.append(contentsOf: products)
                self?.view?.productsFetched()
            }
        }
    }
}
