//
//  LocalProductService.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation
import CoreData

class LocalProductService {
    private let localRepository: CoreDataManager
    
    init(localRepository: CoreDataManager = CoreDataManager.shared) {
        self.localRepository = localRepository
    }
    
}

extension LocalProductService: ProductGateway {
    func getProducts(completionHandler: @escaping (Result<[Product], ProductServiceError>) -> Void) {
        
        let request = CachedProduct.fetchRequest()
        
        do {
            let cachedProducts = try localRepository.context.fetch(request)
            
            let products = cachedProducts.map { cachedProduct -> Product in
                let imgWidth = Double(cachedProduct.imgWidth )
                let imgHeight = Double(cachedProduct.imgHeight )
                let imgUrl = cachedProduct.imgUrl ?? ""
                
                let img = Img(width: imgWidth, height: imgHeight, url: imgUrl)
                
                let product = Product(productId: Int(cachedProduct.productID),
                                      description: cachedProduct.productDescription,
                                      img: img,
                                      price: Int(cachedProduct.productPrice))
                return product
            }
            if products.isEmpty {
                completionHandler(.failure(.network(.notConnected)))
            } else {
            completionHandler(.success(products))
            }
        } catch {
            print("fetching from cache error")
            completionHandler(.failure(.unknown(error)))
        }
    }
    
    func cacheProducts(with products: [Product]) {
        products.forEach { product in
            let cacheProduct = CachedProduct(context: localRepository.context)
            cacheProduct.productID = Int16(product.productId)
            cacheProduct.productPrice = Int16(product.price ?? 0)
            cacheProduct.productDescription = product.description
            cacheProduct.imgUrl = product.img?.url
            cacheProduct.imgWidth = Int16(product.img?.width ?? 0)
            cacheProduct.imgHeight = Int16(product.img?.height ?? 0)
        }
    }
    
    
}
