//
//  ProductDetailsVC.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ProductDetailsVC: UIViewController {

    @IBOutlet weak var _img: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    var presenter: ProductDetailsPresenterProtocol!
    var backButtonTapped: (() -> Void)?
    var navigationDelegate: TransitionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _img.showActivityIndicator()
        presenter.viewLoaded()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavBar()
    }
    
    private func configNavBar() {
        self.hideNavBar()
        let back = UIButton()
        let icon = UIImage(named: Assets.navBackButton)
        back.setImage(icon, for: .normal)
        back.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        let backItem = UIBarButtonItem(customView: back)
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    private func hideNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc
    private func backButtonAction() {
        backButtonTapped?()
    }
}
