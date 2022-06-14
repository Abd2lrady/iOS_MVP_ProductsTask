//
//  ProductGateway.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductGateway {
    func getProducts(completionHandler: @escaping(Result<[Product], ProductServiceError>) -> Void)
}
