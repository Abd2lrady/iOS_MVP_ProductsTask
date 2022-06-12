//
//  ProductCVCell.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductCVCell: UICollectionViewCell {
    static let reuseID = ReuseID.ProductCell
    
    private var _product: Product! {
        didSet {
            priceLabel.text = product.price?.description
            descriptionLabel.text = product.description
            //img.image = UIImage(data: product.imgData)
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var product: Product {
        get {
            return _product
        } set {
            _product = newValue
        }
    }

}
