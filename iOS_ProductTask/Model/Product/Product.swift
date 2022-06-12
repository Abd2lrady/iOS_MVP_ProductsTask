//
//  Product.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

struct Product: Codable {
    let productId: Int
    let description: String?
    let img: Img?
    let price: Int?
    
    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case description = "productDescription"
        case img = "image"
        case price
    }
}

struct Img: Codable {
    let width, height: Int?
    let url: String
}



