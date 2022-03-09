//
//  ProductListPresenterSpy.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
@testable import ArticleList

class ProductListPresenterSpy: ProductListInteractorOutputProtocol, ShoppingCartInteractorOutputProtocol {

    var productsOk: Bool = false
    var products: [ProductEntity] = [ProductEntity]()
    var productsError: Bool = false
    var updateCart: Bool = false
    var totalCartAmountIsZero: Bool = false
    var updateTotalCartAmount: Bool = false

    var asyncExpectation: XCTestExpectation?
    
    func productsDidLoad(products: [ProductEntity]) {
        productsOk = true
        self.products = products
    }
    
    func getProductsError() {
        productsError = true
        products = [ProductEntity]()
    }
    
    func updateCart(cartProducts: [ProductEntity]?) {
        updateCart = true
    }
    
    func updateTotalCartAmount(_ cartAmount: Double) {
        if cartAmount == 0 {
            totalCartAmountIsZero = true
        }
        updateTotalCartAmount = true
    }
    
    func updateKeychainsCartAmount(_ keychainsAmount: Double) {}
    func updateTshirtsCartAmount(_ tshirtsAmount: Double) {}
    func updateMugsCartAmount(_ mugsAmount: Double) {}
    
}
