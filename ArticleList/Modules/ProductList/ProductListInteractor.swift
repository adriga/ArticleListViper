//
//  ProductListInteractor.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

class ProductListInteractor {
    
    weak var presenter: ProductListInteractorOutputProtocol?
    var networkManager: ApiServiceManagerProtocol?
    
}

extension ProductListInteractor: ProductListInteractorInputProtocol {
    
    func getAllProducts() {
        networkManager?.makeRequest(request: GetProductsApiService(), completion: { (response) in
            switch response {
            case .failed:
                self.presenter?.getProductsError()
            case .succeed(let productsDto):
                self.presenter?.productsDidLoad(products: productsDto.products.map({ ProductEntity(dto: $0) }))
            }
        })
    }
    
}
