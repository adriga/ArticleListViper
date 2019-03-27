//
//  ProductListPresenterTests.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
@testable import ArticleList

class ProductListPresenterTests: XCTestCase {

    var sut: ProductListPresenter!
    var routerSpy: ProductListRouterSpy!
    var viewSpy: ProductListViewSpy!
    
    override func setUp() {
        super.setUp()
        self.sut = ProductListPresenter()
        self.routerSpy = ProductListRouterSpy()
        self.viewSpy = ProductListViewSpy()
        self.sut.router = self.routerSpy
        self.sut.view = self.viewSpy
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_shoppingCartClicked_andCartHasProducts_shouldShowShoppingCartModule() {
        // Given
        self.sut.shoppingCart = [ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")]
        
        // When
        self.sut.shoppingCartClicked()
        
        // Then
        XCTAssertTrue(self.routerSpy.showShoppingCartModule)
    }
    
    func test_shoppingCartClicked_andNoProductsInCart_shouldNotShowShoppingCartModule() {
        // Given
        self.sut.shoppingCart = nil
        
        // When
        self.sut.shoppingCartClicked()
        
        // Then
        XCTAssertFalse(self.routerSpy.showShoppingCartModule)
    }
    
    func test_productsDidLoad_shouldReloadProductsList() {
        // When
        self.sut.productsDidLoad(products: [ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")])
        
        // Then
        XCTAssertTrue(self.viewSpy.reloadProducts)
    }
    
    func test_getProductsError_shouldShowNotProductsView() {
        // When
        self.sut.getProductsError()
        
        // Then
        XCTAssertTrue(self.viewSpy.showNotProducts)
    }
    
    func test_updateCart_withSomeProducts_shouldShowCartView_andRefreshCartProductsCount() {
        // When
        self.sut.updateCart(cartProducts: [ProductEntity(code: "KEYCHAIN", name: "Key Chain", price: "5")])
        
        // Then
        XCTAssertTrue(self.viewSpy.showCart)
        XCTAssertTrue(self.viewSpy.setCartProductsCount)
    }
    
    func test_updateCart_withNoProducts_shouldHideCartView() {
        // When
        self.sut.updateCart(cartProducts: nil)
        
        // Then
        XCTAssertTrue(self.viewSpy.hideCart)
    }
    
    func test_updateTotalCartAmount_shouldRefreshCartAmountInView() {
        // When
        self.sut.updateTotalCartAmount(5)
        
        // Then
        XCTAssertTrue(self.viewSpy.setCartAmount)
    }

}
