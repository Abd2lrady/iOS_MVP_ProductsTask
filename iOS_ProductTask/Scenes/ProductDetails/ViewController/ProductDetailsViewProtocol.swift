//
//  ProductDetailsViewProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

protocol ProductDetailsViewProtocol: AnyObject {
    func setProductDetails(description: String, img: UIImage)
    
}

extension ProductDetailsVC: ProductDetailsViewProtocol{
    func setProductDetails(description: String, img: UIImage) {
        self.img.image = img
        descriptionLabel.text = description
    }
    
    
}
