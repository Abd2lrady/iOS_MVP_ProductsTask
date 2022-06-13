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
    var productSelected: ((Int) -> Void)?
}

extension ProductListCVDelegate: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        productSelected?(indexPath.item)        
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
