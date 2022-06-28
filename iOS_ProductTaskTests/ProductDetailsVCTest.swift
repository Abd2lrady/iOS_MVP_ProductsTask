//
//  ProductDetailsVCTest.swift
//  iOS_ProductTaskTests
//
//  Created by Ahmad Abdulrady
//

import XCTest
@testable import  iOS_ProductTask

class ProductDetailsVCTest: XCTestCase {
    
    var sut = ProductDetailsVC()
    
    override func setUpWithError() throws {
        sut.presenter = DummyProductDetailsPresenter()
    }

    override func tearDownWithError() throws {}
    
    func testProductDetailsVC_whenNotLoaded_shouldAllOutletsNotIntialized() throws {
        
        XCTAssertNil(sut._img)
        XCTAssertNil(sut.descriptionLabel)
    }


    func testProductDetailsVC_whenLoaded_shouldAllOutletsIntialized() throws {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut._img)
        XCTAssertNotNil(sut.descriptionLabel)
    }
    
    
    class DummyProductDetailsPresenter: ProductDetailsPresenterProtocol {
        func viewLoaded() {}
        
    }
}
