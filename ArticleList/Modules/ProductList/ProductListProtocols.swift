//
//  ProductListProtocols.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

// MARK: Router
protocol ProductListWireframeProtocol {
    
    func showShoppingCartModule(shoppingCart: [ProductEntity])
    
}

// MARK: View
protocol ProductListViewProtocol: class {
    
    var presenter: ProductListPresenterProtocol? { get set }
    
    /* Presenter -> ViewController */
    func configureView()
    func reloadProducts(products: [ProductViewModel])
    func showNotProductsView()
    func showCartView()
    func hideCartView()
    func setCartProductsCount(_ cartCount: Int)
    func setCartAmount(_ cartAmount: Double)
    
}

// MARK: Presenter
protocol ProductListPresenterProtocol {
    
    /* ViewController -> Presenter */
    func viewDidLoad()
    func reloadProducts()
    func didSelectProduct(product: ProductEntity)
    func shoppingCartClicked()
    
}

// MARK: Interactor
protocol ProductListInteractorInputProtocol {
    
    /* Presenter -> Interactor */
    func getAllProducts()
    
}

protocol ProductListInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */
    func productsDidLoad(products: [ProductEntity])
    func getProductsError()
    
}
