//
//  ModuleFactory.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

protocol ModuleFactory {
    func makeProductListModule(router: ProductListWireframeProtocol) -> ProductListViewController
}
