//
//  ProductsDTO.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

struct ProductsDTO: Decodable {
    let products: [ProductDTO]
}

struct ProductDTO: Decodable {
    let code: String
    let name: String
    let price: Double
}
