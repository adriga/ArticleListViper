//
//  ProductListRouterSpy.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
@testable import ArticleList

class ProductListRouterSpy: ProductListWireframeProtocol {

    var showShoppingCartModule: Bool = false

    func showShoppingCartModule(shoppingCart: [ProductEntity]) {
        showShoppingCartModule = true
    }
    
}
