//
//  ProductEntity.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

struct ProductEntity {
    
    let code: String
    let name: String
    let price: String
    
    init(code: String, name: String, price: String) {
        self.code = code
        self.name = name
        self.price = price
    }
    
    init(dto: ProductDTO) {
        self.code = dto.code
        self.name = dto.name
        self.price = "\(dto.price)"
    }
    
    init(viewModel: ProductViewModel) {
        self.code = viewModel.code
        self.name = viewModel.name
        self.price = viewModel.price
    }
    
}
