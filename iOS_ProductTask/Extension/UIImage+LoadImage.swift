//
//  UIImage+Load.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension UIImageView {
    func loadImage(from url: String) {
        
        let cacheManager = ImageCacheManager.shared
        if let image = cacheManager.getImageFromCache(with: url)
        {
            DispatchQueue.main.async {
                self.image = image
            }
        } else {
            guard let url = URL(string: url),
                  let imgData = try? Data(contentsOf: url)
            else {
                print("error")
                    return
                }
        
           cacheManager.setImageToCache(image: UIImage(data: imgData) ?? UIImage(),
                                        key: url.description)
            DispatchQueue.main.async {
                self.image = UIImage(data: imgData)
            }
        }
    }
}
