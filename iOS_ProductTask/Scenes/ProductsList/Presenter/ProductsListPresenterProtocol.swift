//
//  ProductsListPresenterProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductsListPresenterProtocol {
    var view: ProductsListViewProtocol? { get }
    func viewLoaded()
}
