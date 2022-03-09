//
//  InteractorDependencyContainer.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

class InteractorDependencyContainer {
    private var coreComponentsFactory: CoreComponentsFactory
    
    init(coreComponentsFactory: CoreComponentsFactory) {
        self.coreComponentsFactory = coreComponentsFactory
    }
}

extension InteractorDependencyContainer: InteractorFactory {
    
    func productListInteractor() -> ProductListInteractor {
        let productListInteractor = ProductListInteractor()
        productListInteractor.networkManager = coreComponentsFactory.getNetworkManager()
        return productListInteractor
    }
    
    func shoppingCartInteractor() -> ShoppingCartInteractor {
        return ShoppingCartInteractor()
    }
    
}
