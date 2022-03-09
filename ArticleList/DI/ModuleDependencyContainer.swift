//
//  ModuleDependencyContainer.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

class ModuleDependencyContainer {
    private lazy var presenterFactory: PresenterFactory = PresenterDependencyContainer(coreComponentsFactory: coreComponentsFactory)
    // CoreComponentsFactory could contain shared intances like an analyticsManager that can be used in any layer, so CoreComponentsFactory must be accessible
    private lazy var coreComponentsFactory: CoreComponentsFactory = CoreComponentsDependencyContainer()
}

extension ModuleDependencyContainer: ModuleFactory {
    
    func makeProductListModule(router: ProductListWireframeProtocol) -> ProductListViewController {
        let view = ProductListViewController(nibName: nil, bundle: nil)
        view.presenter = presenterFactory.productListPresenter(view: view, router: router)
        return view
    }
    
}
