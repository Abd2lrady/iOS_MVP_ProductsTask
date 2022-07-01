//
//  NetworkManagerTest.swift
//  iOS_ProductTaskTests
//
//  Created by Ahmad Abdulrady
//

import XCTest
@testable import iOS_ProductTask

class NetworkManagerTest: XCTestCase {
    
    var sut: NetworkManager = {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [URLProtocolStub.self]
        return NetworkManager(sessionConfig: config)
    }()
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}

    
    func testNetworkManager_whenGetValidResponse_shouldReturnSuccessResult() {
        let jsonSample = "this is Dummy Json String"
        let stubData = jsonSample.data(using: .utf8)
        let dummyURL = URL(string: "https://dummy.com")!
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let remoteData = RequestResultStub(data: stubData, response: response, error: nil)
        URLProtocolStub.stub = remoteData
        
        var serverData: Data?
        let validDataExpected = expectation(description: "ValidData")
        sut.request(target: DummyTarget.dummyCase) { result in
            switch result {
            case .success(let data):
                serverData = data
                validDataExpected.fulfill()
            case.failure:
                serverData = nil
                validDataExpected.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertNotNil(serverData)
            XCTAssertEqual(serverData, stubData)
        }
    }
    
    func testNetworkManager_whenGetInvalidResponse_shouldReturnFailureResult() {
        let dummyURL = URL(string: "https://dummy.com")!
        
        let error = NSError(domain: "server Error", code: 404)
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 404, httpVersion: nil, headerFields: nil)
        
        let remoteData = RequestResultStub(data: nil, response: response, error: error)
        
        URLProtocolStub.stub = remoteData
        
        var serverError: Error?
        let errorExpected = expectation(description: "error")

        sut.request(target: DummyTarget.dummyCase) { result in
            switch result {
            case .success:
                serverError = nil
                errorExpected.fulfill()
            case.failure(let error):
                serverError = error
                errorExpected.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertNotNil(serverError)
        }
        
    }

}


enum DummyTarget: NetworkTargetProtocol {
    
    case dummyCase
    
    var scheme: NetworkRequestScheme { .HTTPS }
    
    var baseURL: String { return "www.anyURL.com" }
    
    var path: String { return "/anyPath" }
    
    var method: NetworkRequestMethod { return .get }
}


struct RequestResultStub {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}

class URLProtocolStub: URLProtocol {
    
    static var stub: RequestResultStub?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        guard let stub = URLProtocolStub.stub else {
            client?.urlProtocol(self,
                                didFailWithError: NSError(domain: "no Stub Data",
                                                          code: 0))
            return
        }
        
        if let data = stub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = stub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let error = stub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {   }
}
