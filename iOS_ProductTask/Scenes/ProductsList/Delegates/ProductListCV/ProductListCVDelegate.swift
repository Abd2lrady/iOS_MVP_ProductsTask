//
//  ProductListCVDelegate.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class ProductListCVDelegate: NSObject {
    var loadMore: (() -> Void)?
}

extension ProductListCVDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ProductCVCell
        else { fatalError("can`t get product cell at index \(indexPath.row)")}
        
        let product = cell.product
        print(product)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        let yOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let productsCVHeight = scrollView.bounds.height
        
        if yOffset > ((contentHeight - productsCVHeight) + 5) {
            loadMore?()
        }
    }
}
