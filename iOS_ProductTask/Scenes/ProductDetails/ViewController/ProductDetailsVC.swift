//
//  ProductDetailsVC.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var presenter: ProductDetailsPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.showActivityIndicator()
        presenter.viewLoaded()
        // Do any additional setup after loading the view.
    }

}
