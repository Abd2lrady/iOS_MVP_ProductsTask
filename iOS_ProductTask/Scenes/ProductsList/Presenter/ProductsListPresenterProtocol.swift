//
//  ProductsListPresenterProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductsListPresenterProtocol {
    var view: ProductsListViewProtocol? { get }
    var products: [Product] { get }
    func viewLoaded()
    func loadMore()
    func productSelected(at index: Int)
}
