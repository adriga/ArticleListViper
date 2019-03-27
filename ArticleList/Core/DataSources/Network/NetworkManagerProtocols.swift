//
//  NetworkManagerProtocols.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

protocol ApiServiceManagerProtocol: class {
    func makeRequest<T: ApiService>(request: T, completion:@escaping(ApiResponse<T>)->() )
}
