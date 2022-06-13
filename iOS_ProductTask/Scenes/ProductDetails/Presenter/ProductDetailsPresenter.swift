//
//  ProductDetailsPresenter.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class ProductDetailsPresenter {
    weak var view: ProductDetailsViewProtocol?
    let product: Product
    
    init(view: ProductDetailsViewProtocol, product: Product) {
        self.view = view
        self.product = product
    }
}

extension ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    func viewLoaded() {
        var image: UIImage!
        getProductImg { [ weak self ] img in
            image = img ?? UIImage()
            self?.view?.img.hideActivityIndicator()
            self?.view?.setProductDetails(description: self?.product.description ?? "",
                                    img: image)
            
        }
        
    }

    func getProductImg(completionHandler: @escaping (UIImage?) -> Void) {
        let imageService = ProductImageService()
        imageService.loadImage(url: product.img?.url ?? "") { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    completionHandler(image)
                }
            case .failure:
                print("error assigning image to cell")
            }
        }
    }
}

