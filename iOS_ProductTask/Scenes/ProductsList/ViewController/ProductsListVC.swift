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
    @IBAction func btnTapped(_ sender: Any) {
        print("tapped")
        pic.image = nil
        pic.loadImage(from: "https://i.picsum.photos/id/62/150/308.jpg?hmac=v--t36mvaUNgPphIzLhhqYT3ShCWMZ51V358xiX8dO4")
    }
}

extension ProductsListVC {
    
    func configProductsListCV() {
        productsListCV.delegate = productsListCVDelegate
        productsListCV.dataSource = productsListCVDataSource
        productsListCV.backgroundColor = .clear
    }
    
    func showIndicator() {
        print("showIndicator")
    }
    
    func hideIndicator() {
        print("hideIndicator")
    }
}

extension ProductsListVC: ProductsListViewProtocol {
    func productsFetched() {
        pic.loadImage(from: "https://i.picsum.photos/id/62/150/308.jpg?hmac=v--t36mvaUNgPphIzLhhqYT3ShCWMZ51V358xiX8dO4")
       
        print("product fetched")
        //productsListCVDataSource.products = presenter.
        hideIndicator()
    }
}
