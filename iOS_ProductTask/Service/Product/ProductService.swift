//
//  ProductService.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class ProductService: ProductGateway {
    lazy var remoteProductsRepository = RemoteProductService()
    lazy var localProductsRepository = LocalProductService()
    
        func getProducts(completionHandler: @escaping (Result<[Product], ProductServiceError>) -> Void) {
            
            guard NetworkMonitor.shared.isConnected else {
                localProductsRepository.getProducts { result in
                    switch result {
                    case .success(let products):
                        completionHandler(.success(products))
                    case .failure(let error):
                        print("error with local products service \(error.localizedDescription)")
                    }
                }
            return
            }
            
            remoteProductsRepository.getProducts { [weak self]result in
                switch result {
                case .failure(let error):
                    print("networking error \(error.localizedDescription)")
                    
                case .success(let products):
                    completionHandler(.success(products))
                    self?.cacheProducts(with: products)
                }
            }
    }
    
    func cacheProducts(with products: [Product]) {
        localProductsRepository.cacheProducts(with: products)
    }

}
