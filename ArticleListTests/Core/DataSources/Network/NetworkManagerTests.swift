//
//  NetworkManagerTests.swift
//  ArticleListTests
//
//  Created by Adrián Gil Alonso on 08/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import ArticleList

class NetworkManagerTests: XCTestCase {

    var sut: NetworkManager!
    
    override func setUp() {
        super.setUp()
        sut = NetworkManager()
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func test_GETRequest_with200OkResponse_shouldResponseOk() {
        // Given
        // Mock GET request OK
        stub(condition: isAbsoluteURLString("https://gist.githubusercontent.com/adriga/test") && isMethodGET()) { _ in
            let obj = ["data1": "data1",
                       "data2": "data2"] as [String: Any]
            return OHHTTPStubsResponse(jsonObject: obj, statusCode: 200, headers: nil)
        }
        
        let promise = expectation(description: "Test API service response OK")
        
        // When
        sut.makeRequest(request: TestGetApiService()) { (response) in
            
            // Then
            switch response {
            case .failed:
                XCTFail()
            case .succeed:
                promise.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_GETRequest_with500ErrorResponse_shouldResponseError() {
        // Given
        // Mock GET request KO with 500 error
        stub(condition: isAbsoluteURLString("https://gist.githubusercontent.com/adriga/test") && isMethodGET()) { _ in
            return OHHTTPStubsResponse(jsonObject: [String: Any](), statusCode: 500, headers: nil)
        }
        
        let promise = expectation(description: "Test API service response Error")
        
        // When
        sut.makeRequest(request: TestGetApiService()) { (response) in
            
            // Then
            switch response {
            case .failed:
                promise.fulfill()
            case .succeed:
                XCTFail()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
