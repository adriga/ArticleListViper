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
        code = dto.code
        name = dto.name
        price = "\(dto.price)"
    }
    
    init(viewModel: ProductViewModel) {
        code = viewModel.code
        name = viewModel.name
        price = viewModel.price
    }
    
}
