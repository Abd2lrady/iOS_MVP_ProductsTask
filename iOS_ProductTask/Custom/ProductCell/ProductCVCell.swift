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
            priceLabel.text = "\(product.price?.description ?? "N/A") $ "
            descriptionLabel.text = product.description
            imgHeight.constant = CGFloat(integerLiteral: product.img?.height ?? 300)
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
        contentView.setCorners(with: 5, corners: [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner])
        layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clear()
    }
    var product: Product {
        get {
            return _product
        } set {
            _product = newValue
        }
    }
    
    func clear() {
        img.image = nil
        descriptionLabel.text = ""
        priceLabel.text = ""
        imgHeight.constant = 0
    }

}
