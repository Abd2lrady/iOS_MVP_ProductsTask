//
//  ProductsListViewProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductsListViewProtocol: AnyObject {
    func productsFetched()
    func getError(error: Error)
    func navigateToProductDetails(for product: Product)
}

extension ProductsListVC: ProductsListViewProtocol {
    func navigateToProductDetails(for product: Product) {
        coordinator?.navigateToProductDetails(for: product)
    }
    
    func productsFetched() {
        productsListCVDataSource.products = presenter.products
        DispatchQueue.main.async {
            self.productsListCV.reloadData()
            self.productsListCV.layoutSubviews()
            self.hideIndicator()
        }
    }
    
    func getError(error: Error) {
        print(error.localizedDescription)
        hideIndicator()
    }
}
