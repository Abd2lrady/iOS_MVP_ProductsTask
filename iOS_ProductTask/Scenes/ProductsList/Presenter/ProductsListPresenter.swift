//
//  ProductsListPresenter.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class ProductsListPresenter {
    weak var view: ProductsListViewProtocol?
    
    init(view: ProductsListViewProtocol) {
        self.view = view
    }
}

extension ProductsListPresenter: ProductsListPresenterProtocol {
        
    func viewLoaded() {
         
    }
    
    
}
