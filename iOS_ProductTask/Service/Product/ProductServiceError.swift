//
//  ProductError.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

enum ProductServiceError: Error {
    case network(NetworkError)
    case parse(Error)
    case unknown(Error)
}
