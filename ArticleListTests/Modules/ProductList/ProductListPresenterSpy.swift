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
        self.productsOk = true
        self.products = products
    }
    
    func getProductsError() {
        self.productsError = true
        self.products = [ProductEntity]()
    }
    
    func updateCart(cartProducts: [ProductEntity]?) {
        self.updateCart = true
    }
    
    func updateTotalCartAmount(_ cartAmount: Double) {
        if cartAmount == 0 {
            self.totalCartAmountIsZero = true
        }
        self.updateTotalCartAmount = true
    }
    
    func updateKeychainsCartAmount(_ keychainsAmount: Double) {}
    func updateTshirtsCartAmount(_ tshirtsAmount: Double) {}
    func updateMugsCartAmount(_ mugsAmount: Double) {}
    
}
