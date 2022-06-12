//
//  ImageCacheManager.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

class ImageCacheManager {
    
    private let cache = NSCache<NSString, UIImage>()
    private let config: CacheConfig
    
    static let shared = ImageCacheManager()
    
    init(config: CacheConfig = CacheConfig(countLimit: 100,
                                           memoryLimit: 100 * 1024 * 1024)) {
        self.config = config
    }
    
    func getImageFromCache(with key: String) -> UIImage? {
        cache.object(forKey: NSString(string: key))
    }
    
    func setImageToCache(image: UIImage, key: String) {
        cache.setObject(image, forKey: NSString(string:key))
    }
    
}

struct CacheConfig {
    let countLimit: Int
    let memoryLimit: Int
}
