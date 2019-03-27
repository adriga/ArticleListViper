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
        self.sut = ProductListInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func test_getAllProducts_withSuccessReponse_shouldReturnProducts() {
        // Given
        self.sut.networkManager = NetworkManagerSuccessMock()
        self.presenterSpy = ProductListPresenterSpy()
        self.sut.presenter = self.presenterSpy
        
        // When
        self.sut.getAllProducts()
        
        // Then
        XCTAssertTrue(self.presenterSpy.productsOk)
        XCTAssertEqual(self.presenterSpy.products.count, 2)
    }
    
    func test_getAllProducts_withErrorReponse_shouldCallGetProductsError() {
        // Given
        self.sut.networkManager = NetworkManagerErrorMock()
        self.presenterSpy = ProductListPresenterSpy()
        self.sut.presenter = self.presenterSpy
        
        // When
        self.sut.getAllProducts()
        
        // Then
        XCTAssertTrue(self.presenterSpy.productsError)
        XCTAssertEqual(self.presenterSpy.products.count, 0)
    }
    
}

