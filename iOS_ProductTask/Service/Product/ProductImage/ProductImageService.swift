//
//  ProductImageService.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class ProductImageService {
    func loadImage(url: String,
                   completionHandler: @escaping ((Result<UIImage,Error>) -> Void)) {
        
        let cacheManager = ImageCacheManager.shared
        if let image = cacheManager.getImageFromCache(with: url)
        {
            completionHandler(.success(image))
        } else {
            guard let url = URL(string: url)
            else {
                print("Bad Image URL")
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completionHandler(.failure(error))
                    return
                } else if let response = (response as? HTTPURLResponse),
                          !(200...299).contains(response.statusCode) {
                    
                    completionHandler(.failure(NetworkError.serverError(statusCode: response.statusCode)))
                } else if let data = data{
                    if let image = UIImage(data: data) {
                        cacheManager.setImageToCache(image: image,
                                                     key: url.description)
                    completionHandler(.success(image))
                    } else {
                        print("bad Image")
                    }
                }
            }.resume()
        }
    }
}
