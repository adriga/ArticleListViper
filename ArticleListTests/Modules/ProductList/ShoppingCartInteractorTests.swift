//
//  ShoppingCartInteractorTests.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import ArticleList

class ShoppingCartInteractorTests: XCTestCase {
    
    var sut: ShoppingCartInteractor!
    var presenterSpy: ProductListPresenterSpy!

    override func setUp() {
        super.setUp()
        self.sut = ShoppingCartInteractor()
        self.presenterSpy = ProductListPresenterSpy()
        self.sut.presenter = self.presenterSpy
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func test_addProductToCart_shouldRefreshCart_withNewProduct() {
        // Given
        let mockProduct = ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")
        self.sut.shoppingCart = [mockProduct]
        
        // When
        self.sut.addProductToCart(product: ProductEntity(code: "TSHIRT", name: "T-Shirt", price: "20"))
        
        // Then
        XCTAssertTrue(self.presenterSpy.updateCart)
        XCTAssertEqual(self.sut.shoppingCart?.count, 2)
    }
    
    func test_getTotalCartAmount_withEmptyCart_shouldUpdateCartAmountWithZero() {
        // Given
        self.sut.shoppingCart = nil
        
        // When
        self.sut.getTotalCartAmount()
        
        // Then
        XCTAssertTrue(self.presenterSpy.updateTotalCartAmount)
        XCTAssertTrue(self.presenterSpy.totalCartAmountIsZero)
    }
    
    func test_getTotalCartAmount_withValidCart() {
        // Given
        let mockProduct = ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")
        self.sut.shoppingCart = [mockProduct]
        
        // When
        self.sut.getTotalCartAmount()
        
        // Then
        XCTAssertTrue(self.presenterSpy.updateTotalCartAmount)
        XCTAssertFalse(self.presenterSpy.totalCartAmountIsZero)
    }
    
    func test_getKeychainCartAmount_withEmptyCart_shouldReturnZero() {
        // Given
        self.sut.shoppingCart = []
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 0)
    }
    
    func test_getKeychainCartAmount_withCartWithoutKeychains_shouldReturnZero() {
        // Given
        let mockProduct = ProductEntity(code: "TSHIRT", name: "T-Shirt", price: "20")
        self.sut.shoppingCart = [mockProduct]
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 0)
    }
    
    func test_getKeychainCartAmount_withInvalidCart_shouldReturnZero() {
        // Given
        self.sut.shoppingCart = nil
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 0)
    }
    
    func test_getKeychainCartAmount_withOneKeychainInTheCart_shouldReturnCorrectAmount() {
        // Given
        let mockProduct = ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")
        self.sut.shoppingCart = [mockProduct]
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 5)
    }
    
    func test_getKeychainCartAmount_withTwoKeychainsInTheCart_shouldReturnCorrectAmount() {
        // Given
        let mockProduct = ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")
        self.sut.shoppingCart = [mockProduct, mockProduct]
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 5)
    }
    
    func test_getKeychainCartAmount_withThreeKeychainsInTheCart_shouldReturnCorrectAmount() {
        // Given
        let mockProduct = ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")
        self.sut.shoppingCart = [mockProduct, mockProduct, mockProduct]
        
        // When
        let keychainsAmount = self.sut.calculateKeychainsAmount()
        
        // Then
        XCTAssertEqual(keychainsAmount, 10)
    }
    
    func test_getTshirtCartAmount_withOneTshirtInTheCart() {
        // Given
        let mockProduct = ProductEntity(code: "TSHIRT", name: "T-Shirt", price: "20")
        self.sut.shoppingCart = [mockProduct]
        
        // Then
        XCTAssertEqual(self.sut.calculateTshirtsAmount(), 20)
    }
    
    func test_getTshirtCartAmount_withThreeTshirtInTheCart() {
        // Given
        let mockProduct = ProductEntity(code: "TSHIRT", name: "T-Shirt", price: "20")
        self.sut.shoppingCart = [mockProduct, mockProduct, mockProduct]
        
        // Then
        XCTAssertEqual(self.sut.calculateTshirtsAmount(), 57)
    }

}
