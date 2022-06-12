//
//  ProductsListViewProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductsListViewProtocol: AnyObject {
    func productsFetched()
    func getError(error: Error)
}
