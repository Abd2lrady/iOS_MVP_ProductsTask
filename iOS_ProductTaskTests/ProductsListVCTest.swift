//
//  ProductsListVCTest.swift
//  iOS_ProductTaskTests
//
//  Created by Ahmad Abdulrady
//

import XCTest
@testable import iOS_ProductTask


class ProductsListVCTest: XCTestCase {
    
    var sut = ProductsListVC()
    
    override func setUpWithError() throws {
        sut.presenter = DummyProductListVCPresenter()
    }

    override func tearDownWithError() throws {
    }
    
    
    func testProductsListVC_whenLoaded_ShouldAllOutletsIntialized() throws {

            sut.loadViewIfNeeded()

            XCTAssertNotNil(sut.productsListCV)
        }
    
    
    func testProductsListVC_whenNotLoaded_ShouldAllOutletsNotIntialized() throws {

        XCTAssertNil(sut.productsListCV)
    }

    
    class DummyProductListVCPresenter: ProductsListPresenterProtocol {
        var view: ProductsListViewProtocol?
        
        var products: [Product] = []
        
        func viewLoaded() {}
        
        func loadMore() {}
        
        func productSelected(at index: Int) {}
  
    }

}
