//
//  NetworkManagerMocks.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 20/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation
@testable import ArticleList

class NetworkManagerSuccessMock: ApiServiceManagerProtocol {
    
    func makeRequest<T: ApiService>(request: T, completion:@escaping(ApiResponse<T>)->() ) {
        let dto = ProductsDTO(products: [ProductDTO(code: "KEYCHAIN", name: "Key Chain", price: 5), ProductDTO(code: "TSHIRT", name: "T-Shirt", price: 20)]) as! T.Response
        completion(.succeed(dto))
    }
    
}

class NetworkManagerErrorMock: ApiServiceManagerProtocol {
    
    func makeRequest<T: ApiService>(request: T, completion:@escaping(ApiResponse<T>)->() ) {
        completion(.failed(NSError()))
    }
    
}
