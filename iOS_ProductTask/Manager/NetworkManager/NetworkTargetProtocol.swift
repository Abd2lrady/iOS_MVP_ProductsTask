//
//  TargetProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol NetworkTargetProtocol {
    var scheme: NetworkRequestScheme { get }
    var baseURL: String { get }
    var path: String { get }
    var method: NetworkRequestMethod { get }
}

enum NetworkRequestScheme: String {
    case HTTP = "http"
    case HTTPS = "https"
}

enum NetworkRequestMethod: String {
    case get = "GET"
}
