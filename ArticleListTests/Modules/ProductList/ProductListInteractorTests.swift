//
//  ProductListInteractorTests.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
@testable import ArticleList

class ProductListInteractorTests: XCTestCase {
    
    var sut: ProductListInteractor!
    var presenterSpy: ProductListPresenterSpy!
    
    override func setUp() {
        super.setUp()
        sut = ProductListInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func test_getAllProducts_withSuccessReponse_shouldReturnProducts() {
        // Given
        sut.networkManager = NetworkManagerSuccessMock()
        presenterSpy = ProductListPresenterSpy()
        sut.presenter = presenterSpy
        
        // When
        sut.getAllProducts()
        
        // Then
        XCTAssertTrue(presenterSpy.productsOk)
        XCTAssertEqual(presenterSpy.products.count, 2)
    }
    
    func test_getAllProducts_withErrorReponse_shouldCallGetProductsError() {
        // Given
        sut.networkManager = NetworkManagerErrorMock()
        presenterSpy = ProductListPresenterSpy()
        sut.presenter = presenterSpy
        
        // When
        sut.getAllProducts()
        
        // Then
        XCTAssertTrue(presenterSpy.productsError)
        XCTAssertEqual(presenterSpy.products.count, 0)
    }
    
}

