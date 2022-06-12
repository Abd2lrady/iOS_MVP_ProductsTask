//
//  RemoteProductService.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

class RemoteProductService: ProductGateway {
    private let remoteRepository: NetworkManager
    
    init(remoteRepository: NetworkManager =  NetworkManager.shared) {
        self.remoteRepository = NetworkManager.shared
    }

    func getProducts(completionHandler: @escaping (Result<[Product], ProductServiceError>) -> Void) {
        remoteRepository.request(target: ProductTarget.getProducts) { result in
            switch result {
            case .success(let productData):
                do {
                    let products = try JSONDecoder().decode([Product].self, from: productData)
                    completionHandler(.success(products))
                    return
                } catch (let error) {
                    completionHandler(.failure(ProductServiceError.parse(error)))
                    print("parsing error")
                }
            case .failure(let error):
                completionHandler(.failure(ProductServiceError.network((error as? NetworkError) ?? NetworkError.unknownError(error: error))))
                print(error)
            }
        }
    }
    
    
}
