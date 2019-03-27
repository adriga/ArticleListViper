//
//  GetProductsApiService.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 01/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation

struct GetProductsApiService: ApiService {
    
    typealias Response = ProductsDTO
    
    var resourceName: String {
        return "/bins/w8qe2"
    }
    
    var operationType: String {
        return "GET"
    }
    
    var body: [String: Any]? {
        return nil
    }
    
}
