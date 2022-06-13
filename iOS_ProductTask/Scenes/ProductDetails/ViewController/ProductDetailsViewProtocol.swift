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
    var img: UIImageView { get set }
}

extension ProductDetailsVC: ProductDetailsViewProtocol{
    func setProductDetails(description: String, img: UIImage) {
        self._img.image = img
        descriptionLabel.text = description
    }
    
    var img: UIImageView {
        get {
            return self._img
        } set {
            self._img = newValue
        }
    }
    
}
