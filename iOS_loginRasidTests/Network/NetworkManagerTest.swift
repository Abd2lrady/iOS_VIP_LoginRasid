//
//  networkTests.swift
//  iOS_loginRasidTests
//
//  Created by Fintech on 11/12/2022.
//

import XCTest
import Alamofire
@testable import iOS_loginRasid

// swiftlint: disable all
class NetworkManagerTest: XCTestCase {
    
    var interceptor: RequestInterceptor?
    let configurationWithMock = URLSessionConfiguration.default
    
    lazy var sut: APIClient = {
        configurationWithMock.protocolClasses = [URLProtocolStub.self]
        
        return APIClient.init(configuration: configurationWithMock,
                              interceptor: interceptor)
    }()
    
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    
    func testNetworkManager_whenGetInvalidResponse_shouldReturnFailureResult() {
        let dummyURL = URL(string: "https://dummy.com")!
        
        let error = NSError(domain: "server Error", code: 404)
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 404, httpVersion: nil, headerFields: nil)
        
        let remoteData = RequestResultStub(data: nil, response: response, error: error)
        
        URLProtocolStub.stub = remoteData
        
        var serverError: Error?
        let errorExpected = expectation(description: "error")
        
        sut.request(for: DummyEndPointRouter.dummyCase,
                    responseType: DummyResponseType.self) { result in
            switch result {
            case .success:
                serverError = nil
            case.failure(let error):
                serverError = error
            }
            errorExpected.fulfill()
        }
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertNotNil(serverError)
        }
        
    }
    
    func testNetworkManager_whenGetValidResponse_shouldReturnValidResult() {
        let dummyURL = URL(string: "https://dummy.com")!
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 200, httpVersion: nil, headerFields: nil)
        let jsonData = """
                    {}
                    """.data(using: .utf8)
        let remoteData = RequestResultStub(data: jsonData,
                                           response: response,
                                           error: nil)
        
        URLProtocolStub.stub = remoteData
        
        var serverError: Error?
        let errorExpected = expectation(description: "error")
        
        sut.request(for: DummyEndPointRouter.dummyCase,
                    responseType: DummyResponseType.self) { result in
            switch result {
            case .success:
                serverError = nil
            case.failure(let error):
                serverError = error
            }
            errorExpected.fulfill()
        }
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertNil(serverError)
        }
        
    }
    
    
    func testNetworkManager_whenGetInvalidResponse_shouldRetryForRetryLimeTimes() {
        
        let retryLimit = 3
        
        interceptor = InterceptorSpy(authToken: "",
                                      retryLimit: retryLimit)
        
        let dummyURL = URL(string: "https://dummy.com")!
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 400, httpVersion: nil, headerFields: nil)
        
        let remoteData = RequestResultStub(data: nil,
                                           response: response,
                                           error: nil)
        
        URLProtocolStub.stub = remoteData
        
        let errorExpected = expectation(description: "Retry Before Error")
        
        sut.request(for: DummyEndPointRouter.dummyCase,
                    responseType: DummyResponseType.self) { _ in
            errorExpected.fulfill()
        }
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertEqual((self.interceptor as! InterceptorSpy).retryCount,
                           retryLimit)
        }
    }
    
    func testNetworkManager_whenGetRequest_shouldContainAuth() {
        
        let testAuthToken = "authTestToken"
        interceptor = InterceptorSpy(authToken: "authTestToken")
        
        let dummyURL = URL(string: "https://dummy.com")!
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)
        
        let remoteData = RequestResultStub(data: nil,
                                           response: response,
                                           error: nil)
        
        URLProtocolStub.stub = remoteData
        
        let authTokenExpected = expectation(description: "Auth Token Expected")

        sut.request(for: DummyEndPointRouter.dummyCase,
                    responseType: DummyResponseType.self) { _ in
            authTokenExpected.fulfill()
        }

        waitForExpectations(timeout: 0.1) { _ in
            let token = (self.interceptor as! InterceptorSpy).token?.split(separator: " ")[1] ?? ""
            XCTAssertEqual(String(token), testAuthToken)

        }
    }
    
    func testNetworkManager_whenGetResponse_shouldReturnModel() {
        let dummyURL = URL(string: "https://dummy.com")!
        
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let expectedUser = DummyResponseType(id: 3, userName: "Abd2lrady")
        var fetchedUser: DummyResponseType?

        let jsonData = try! JSONSerialization.data(withJSONObject: expectedUser.getBody())
        
        let remoteData = RequestResultStub(data: jsonData,
                                           response: response,
                                           error: nil)
        
        URLProtocolStub.stub = remoteData
        
        let userExpected = expectation(description: "user Model Expected")

        sut.request(for: DummyEndPointRouter.dummyCase,
                    responseType: DummyResponseType.self) { result in
            switch result {
            case .success(let res):
                fetchedUser = res
            case.failure(let error):
                print(error)
            }
            userExpected.fulfill()
        }
        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertEqual(fetchedUser, expectedUser)
        }
        
    }
}

