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
            img.loadImage(from: product.img?.url ?? "")
            imgHeight.constant = CGFloat(integerLiteral: product.img?.height ?? 300)
            layoutSubviews()
        }
    }
    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        contentView.setBorders(with: 5, color: .darkGray)
        contentView.setCorners(with: 5, corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
    }
    var product: Product {
        get {
            return _product
        } set {
            _product = newValue
        }
    }

}
