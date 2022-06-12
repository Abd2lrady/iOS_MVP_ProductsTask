//
//  NetworkError.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case notConnected
    case invalidData
    case invalidRequest(statusCode: Int)
    case serverError(statusCode: Int)
    case unknownError(error: Error)
    case unknownResponse(response: URLResponse)
}
