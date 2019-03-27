//
//  RequestOperationHelper.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Alamofire

enum RequestOperationHelper {
    
    static func getUrlRequest(url: String, body: [String: Any]?, operationType: String) -> URLRequest? {
        guard let url = URL(string: url) else {
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = operationType
        urlRequest.timeoutInterval = 30
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        guard body == nil else {
            do {
                urlRequest = try Alamofire.JSONEncoding().encode(urlRequest, with: body)
                return urlRequest
            } catch {
                return nil
            }
        }
        return urlRequest
    }
    
}
