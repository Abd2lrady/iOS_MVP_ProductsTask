//
//  ViewController.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductsListVC: UIViewController {

    @IBOutlet weak var pic: UIImageView!
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
    
    func configProductsListCV() {
        let cellNib = UINib(nibName: "\(ProductCVCell.self)",
                            bundle: .main)
        productsListCV.register(cellNib,
                                forCellWithReuseIdentifier: ReuseID.ProductCell)
        productsListCV.delegate = productsListCVDelegate
        productsListCV.dataSource = productsListCVDataSource
        let layout = productsListCV.collectionViewLayout
        if let flowLayout = layout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 150, height: 500)
        }
        productsListCV.backgroundColor = .clear
    }
    
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

extension ProductsListVC: ProductsListViewProtocol {
    func productsFetched() {
        productsListCVDataSource.products = presenter.products
        DispatchQueue.main.async {
            self.productsListCV.reloadData()
            self.hideIndicator()
        }
    }
    
    func getError(error: Error) {
        //hideIndicator()
    }
}
