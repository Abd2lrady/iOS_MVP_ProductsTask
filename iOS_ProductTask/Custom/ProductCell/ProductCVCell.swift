//
//  ProductCVCell.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductCVCell: UICollectionViewCell {
    static let reuseID = ReuseID.ProductCell
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func config(product: ProductCellModel) {
        priceLabel.text = product.price
        descriptionLabel.text = product.description
        img.image = UIImage(data: product.imgData)
    }
}
