//
//  ApiService.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

protocol ApiService {
    
    associatedtype Response: Decodable
    var resourceName: String { get }
    var operationType: String { get }
    var body: [String: Any]? { get }
    
}
