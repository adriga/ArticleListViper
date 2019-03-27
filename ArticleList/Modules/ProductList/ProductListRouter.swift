//
//  ProductListRouter.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import UIKit

class ProductListRouter {
    
    weak var viewController: UIViewController?
    private var moduleFactory: ModuleFactory?
    
    func createModule(factory: ModuleFactory?) -> UIViewController? {
        self.moduleFactory = factory
        // The module is created with all needed dependencies
        let view = factory?.makeProductListModule(router: self)
        self.viewController = view
        view?.title = NSLocalizedString("products_title", comment: "")
        return view
    }

}

extension ProductListRouter: ProductListWireframeProtocol {
    
    func showShoppingCartModule(shoppingCart: [ProductEntity]) {
        // Navigate to shopping cart screen. This module is not implemented for the challenge
//        if case let shoppingCartModule as ShoppingCartViewController = ShoppingCartRouter().createModule(factory: self.moduleFactory) {
//            shoppingCartModule.presenter?.shoppingCart = shoppingCart
//            self.viewController?.navigationController?.pushViewController(shoppingCartModule, animated: true)
//        }
    }
    
}
