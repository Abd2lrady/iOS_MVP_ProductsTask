//
//  ProductListVC+UICollectionViewLayout.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension ProductsListVC {
    func configLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidth = (UIScreen.main.bounds.width / 2) - 10
        layout.estimatedItemSize = CGSize(width: cellWidth, height: 500)
        layout.minimumInteritemSpacing = 2
        return layout
    }
    
    
    func configProductsListCV() {
        let cellNib = UINib(nibName: "\(ProductCVCell.self)",
                            bundle: .main)
        productsListCV.register(cellNib,
                                forCellWithReuseIdentifier: ReuseID.ProductCell)
        
        productsListCV.delegate = productsListCVDelegate
        productsListCV.dataSource = productsListCVDataSource
        productsListCVDelegate.loadMore = self.loadMore
        
        if let layout = productsListCV.collectionViewLayout as? AdaptiveUICollectionViewLayout {
            layout.delegate = productsListCVDataSource
        }

        productsListCV.backgroundColor = .black
    }
    
}
