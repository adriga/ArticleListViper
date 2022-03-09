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
        reloadProducts = true
    }
    
    func showNotProductsView() {
        showNotProducts = true
    }
    
    func showCartView() {
        showCart = true
    }
    
    func hideCartView() {
        hideCart = true
    }
    
    func setCartProductsCount(_ cartCount: Int) {
        setCartProductsCount = true
    }
    
    func setCartAmount(_ cartAmount: Double) {
        setCartAmount = true
    }

}
