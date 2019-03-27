//
//  ProductListViewSpy.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
@testable import ArticleList

class ProductListViewSpy: ProductListViewProtocol {
    
    var reloadProducts: Bool = false
    var showNotProducts: Bool = false
    var showCart: Bool = false
    var hideCart: Bool = false
    var setCartProductsCount: Bool = false
    var setCartAmount: Bool = false
    
    var presenter: ProductListPresenterProtocol?

    func configureView() {}
    
    func reloadProducts(products: [ProductViewModel]) {
        self.reloadProducts = true
    }
    
    func showNotProductsView() {
        self.showNotProducts = true
    }
    
    func showCartView() {
        self.showCart = true
    }
    
    func hideCartView() {
        self.hideCart = true
    }
    
    func setCartProductsCount(_ cartCount: Int) {
        self.setCartProductsCount = true
    }
    
    func setCartAmount(_ cartAmount: Double) {
        self.setCartAmount = true
    }

}
