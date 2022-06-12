//
//  ProductListCVDataSource.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class ProductListCVDataSource: NSObject {
    var products = [Product]()
    
}

extension ProductListCVDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCVCell.reuseID,
                                                            for: indexPath) as? ProductCVCell
        else { fatalError("error deque cell \(ProductCVCell.self)") }
        
        cell.product = products[indexPath.row]
        
        return cell
    }
    
    
    
    
}
