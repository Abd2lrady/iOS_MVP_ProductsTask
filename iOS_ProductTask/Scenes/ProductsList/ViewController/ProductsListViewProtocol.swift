//
//  ProductsListViewProtocol.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import Foundation

protocol ProductsListViewProtocol: AnyObject {
    var presenter: ProductsListPresenterProtocol! { get }
    func productsFetched()
}
