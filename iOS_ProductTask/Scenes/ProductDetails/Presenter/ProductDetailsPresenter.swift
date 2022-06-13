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
    var product: Product!
    
    init(view: ProductDetailsViewProtocol) {
        self.view = view
    }
}

extension ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    func viewLoaded() {
        var image: UIImage!
        getProductImg { img in
            image = img ?? UIImage()
        }
        
        view?.setProductDetails(description: product.description ?? "",
                                img: image)
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

