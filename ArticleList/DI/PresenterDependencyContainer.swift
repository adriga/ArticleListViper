//
//  PresenterDependencyContainer.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

class PresenterDependencyContainer {
    private lazy var interactorFactory: InteractorFactory = InteractorDependencyContainer(coreComponentsFactory: self.coreComponentsFactory)
    private var coreComponentsFactory: CoreComponentsFactory
    
    init(coreComponentsFactory: CoreComponentsFactory) {
        self.coreComponentsFactory = coreComponentsFactory
    }
}

extension PresenterDependencyContainer: PresenterFactory {
    
    func productListPresenter(view: ProductListViewProtocol, router: ProductListWireframeProtocol) -> ProductListPresenter {
        let productListInteractor = self.interactorFactory.productListInteractor()
        let shoppingCartInteractor = self.interactorFactory.shoppingCartInteractor()
        let presenter = ProductListPresenter()
        presenter.view = view
        presenter.productListInteractor = productListInteractor
        presenter.shoppingCartInteractor = shoppingCartInteractor
        presenter.router = router
        productListInteractor.presenter = presenter
        shoppingCartInteractor.presenter = presenter
        return presenter
    }
    
}
