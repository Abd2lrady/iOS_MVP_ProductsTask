//
//  ViewController.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductsListVC: UIViewController {

    @IBOutlet weak var productsListCV: UICollectionView! {
        didSet {
            configProductsListCV()
        }
    }
    var presenter: ProductsListPresenterProtocol!
    weak var coordinator: ProductsListCoordinatorProtocol?
    lazy var productsListCVDelegate = ProductListCVDelegate()
    lazy var productsListCVDataSource = ProductListCVDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewLoaded()
        showIndicator()
    }
}

extension ProductsListVC {

    func showIndicator() {
        DispatchQueue.main.async {
            self.view.showActivityIndicator()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.view.hideActivityIndicator()
        }
    }
}
