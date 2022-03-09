//
//  RequestOperation.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 02/02/2019.
//  Copyright © 2018 Adrian Gil Alonso. All rights reserved.
//

import Alamofire

class RequestOperation<T: ApiService>: Operation {
    
    // Base server url is hardcoded because there is only one environment, but in an app with different environments it would be in a plist file for each environment
    final let serverBaseUrl = "https://gist.githubusercontent.com/adriga"
    
    let sessionManager: SessionManager = {
        // SSL pinning to avoid MITM attacks
        let serverTrustPolicies: [String: ServerTrustPolicy] = ["www.github.com": ServerTrustPolicy.pinCertificates(certificates: ServerTrustPolicy.certificates(in: Bundle.main), validateCertificateChain: true, validateHost: true)]
        let policyManager =  ServerTrustPolicyManager(policies: serverTrustPolicies)
        let sessionManager = SessionManager(serverTrustPolicyManager: policyManager)
        return sessionManager
    }()
    
    var url: String
    var body: [String: Any]?
    var operationType: String
    var completion: (ApiResponse<T>)->()
    var request: T
    
    init(request: T, completion:@escaping(ApiResponse<T>)->() ) {
        url = serverBaseUrl + request.resourceName
        body = request.body
        operationType = request.operationType
        self.completion = completion
        self.request = request
    }
    
    override func main() {
        // RequestOperationHelper.getUrlRequest give us the valid url request with endpoint url, request body (if needed, for POST requests for example), request operation (GET, POST...), needed headers...
        let request = RequestOperationHelper.getUrlRequest(url: url, body: body, operationType: operationType)
        if let urlRequest = request {
            requestWithJSONResponse(urlRequest)
        }
    }
    
    // If we have others possible reponse types like XML, we can easily add other methods that parse and returns the correct DTO transparently to the interactors
    private func requestWithJSONResponse(_ urlRequest: URLRequest) {
        sessionManager.request(urlRequest).validate().responseData { (response) in
            switch response.result {
            case .success(let responseObject):
                do {
                    // JSON is parsed into response object type, that is defined in each ApiService object
                    let dto = try JSONDecoder().decode(T.Response.self, from: responseObject)
                    self.completion(.succeed(dto))
                } catch {
                    self.completion(.failed(NSError()))
                }
            case .failure(let error):
                self.completion(.failed(error))
            }
        }
    }
    
}
