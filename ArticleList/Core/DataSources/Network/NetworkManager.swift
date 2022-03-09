//
//  NetworkManager.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Foundation

// ApiResponse depends on api request response type. It makes very easy the parse process
enum ApiResponse<T: ApiService> {
    case succeed(T.Response)
    case failed(Error)
}

class NetworkManager {
    
   private lazy var apiOperationQueue: OperationQueue = {
        var operationQueue = OperationQueue()
        operationQueue.name = "com.adrian.articlelist.apioperationqueue"
        operationQueue.maxConcurrentOperationCount = 1
        return operationQueue
    }()
    
}

extension NetworkManager: ApiServiceManagerProtocol {
    
    func makeRequest<T: ApiService>(request: T, completion:@escaping(ApiResponse<T>)->() ) {
        let requestOperation: RequestOperation = RequestOperation(request: request, completion: completion)
        apiOperationQueue.addOperation(requestOperation)
    }
    
}
