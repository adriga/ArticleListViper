//
//  TestGetApiService.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 08/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import Foundation
@testable import ArticleList

struct TestGetApiService: ApiService {
    
    typealias Response = TestResponseDTO
    
    var resourceName: String {
        return "/test"
    }
    
    var operationType: String {
        return "GET"
    }
    
    var body: [String: Any]? {
        return nil
    }
    
}
