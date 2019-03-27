//
//  ProductListUITests.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 11/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import ArticleList

class ProductListUITests: KIFTestCase {
    
    var moduleFactory: ModuleDependencyContainer!

    override func beforeEach() {
        super.beforeEach()
        self.moduleFactory = ModuleDependencyContainer()
        if let productListModule = ProductListRouter().createModule(factory: self.moduleFactory) as? ProductListViewController {
            UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: productListModule)
        }
    }
    
    override func afterEach() {
        OHHTTPStubs.removeAllStubs()
        super.afterEach()
    }
    
    func test_viewDidLoad_withProductsErrorResponse_shouldShowNoProductsView() {
        // Given
        // Mock GET request Error
        stub(condition: isAbsoluteURLString("https://api.myjson.com/bins/w8qe2") && isMethodGET()) { _ in
            return OHHTTPStubsResponse(jsonObject: [String: Any](), statusCode: 500, headers: nil)
        }
        
        // Then
        tester().waitForView(withAccessibilityIdentifier: NSLocalizedString("no_products", comment: ""))
    }
    
    func test_viewDidLoad_shouldShowProducts() {
        tester().waitForView(withAccessibilityIdentifier: "ProductCell")
    }
    
    func test_viewDidLoad_withProductsSuccessResponse_shouldShowProducts() {
        // Given
        // Mock GET request OK
        stub(condition: isAbsoluteURLString("https://api.myjson.com/bins/w8qe2") && isMethodGET()) { _ in
            let obj = ["products": [["code": "KEYCHAIN", "name": "Key Chain", "price": 5],
                                    ["code": "TSHIRT", "name": "T-Shirt", "price": 20],
                                    ["code": "MUG", "name": "Coffee Mug", "price": 7.5]]] as [String: Any]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        // Then
        tester().waitForView(withAccessibilityIdentifier: "Key Chain")
    }
    
    func test_whenClickOnAProdut_itShouldBeAddedToCart() {
        // Given
        // Mock GET request OK
        stub(condition: isAbsoluteURLString("https://api.myjson.com/bins/w8qe2") && isMethodGET()) { _ in
            let obj = ["products": [["code": "KEYCHAIN", "name": "Key Chain", "price": 5],
                                    ["code": "TSHIRT", "name": "T-Shirt", "price": 20],
                                    ["code": "MUG", "name": "Coffee Mug", "price": 7.5]]] as [String: Any]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        // When
        tester().tapRow(at: IndexPath(item: 0, section: 0), inTableViewWithAccessibilityIdentifier: "ProductList")
        
        // Then
        if let productsInCart = tester().waitForView(withAccessibilityIdentifier: "cartProductsLabel") as? UILabel {
            XCTAssertEqual(productsInCart.text, String(format: NSLocalizedString("shopping_cart_products", comment: ""), 1))
        }
    }

}
