//
//  UIImage+Load.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension UIImageView {
    func loadImage(from url: String) {
        guard let url = URL(string: url),
              let imgData = try? Data(contentsOf: url)
        else { fatalError("Bad Image URL") }
        
        DispatchQueue.main.async {
            self.image = UIImage(data: imgData)
        }
    }
}
