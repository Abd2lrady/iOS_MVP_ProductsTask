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
    let imageService = ProductImageService()
    
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
        
        let product = products[indexPath.row]
        cell.product = product
        cell.img.showActivityIndicator()
        imageService.loadImage(url: product.img?.url ?? "") { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    cell.img.hideActivityIndicator()
                    cell.img.image = image
                }
            case .failure:
                print("error assigning image to cell")
            }
        }
        
        cell.layoutSubviews()
        return cell
    }
    
}

extension ProductListCVDataSource: AdaptiveUICollectionViewLayoutProtocol {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
            
        return CGFloat(products[indexPath.item].img?.height ?? 500)
    }
    
    
}
