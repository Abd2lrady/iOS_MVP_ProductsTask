//
//  ProductTarget.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

enum ProductTarget {
    
    case getProducts
}

extension ProductTarget: NetworkTargetProtocol {
    
    var method: NetworkRequestMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var scheme: NetworkRequestScheme {
        switch self {
        case .getProducts:
            return .HTTPS
        }
    }
    
    var baseURL: String {
        switch self {
        case .getProducts:
            return Constants.Api.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return Constants.Api.path
        }
    }
}
