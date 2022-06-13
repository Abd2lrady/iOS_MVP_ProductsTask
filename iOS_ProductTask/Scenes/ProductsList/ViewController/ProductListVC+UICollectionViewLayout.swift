//
//  ProductListVC+UICollectionViewLayout.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension ProductsListVC {
    func configLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .estimated(500))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 2, bottom: 2, trailing: 2)
        let groubSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(500))
        
        let groub = NSCollectionLayoutGroup.horizontal(layoutSize: groubSize, subitem: item, count: 2)
        
        let section = NSCollectionLayoutSection(group: groub)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configProductsListCV() {
        let cellNib = UINib(nibName: "\(ProductCVCell.self)",
                            bundle: .main)
        productsListCV.register(cellNib,
                                forCellWithReuseIdentifier: ReuseID.ProductCell)
        productsListCV.delegate = productsListCVDelegate
        productsListCV.dataSource = productsListCVDataSource
        let layout = configLayout()
        productsListCV.collectionViewLayout = layout
        productsListCV.backgroundColor = .clear
    }
    
}
