//
//  ProductListVC+UICollectionViewLayout.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension ProductsListVC {
    func configProductsListCV() {
        let cellNib = UINib(nibName: "\(ProductCVCell.self)",
                            bundle: .main)
        productsListCV.register(cellNib,
                                forCellWithReuseIdentifier: ReuseID.ProductCell)
        
        productsListCV.delegate = productsListCVDelegate
        productsListCV.dataSource = productsListCVDataSource
        productsListCVDelegate.loadMore = self.loadMore
        productsListCVDelegate.productSelected = self.productSelected
        
        if let layout = productsListCV.collectionViewLayout as? AdaptiveUICollectionViewLayout {
            layout.delegate = productsListCVDataSource
        }
        productsListCV.backgroundColor = .black
    }
    
    func loadMore() {
        view.showActivityIndicator()
        presenter.loadMore()
    }
    
    func productSelected(at index: Int) {
        presenter.productSelected(at: index)
    }
    
}



