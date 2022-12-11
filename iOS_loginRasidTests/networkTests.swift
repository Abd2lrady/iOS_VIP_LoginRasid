//
//  networkTests.swift
//  iOS_loginRasidTests
//
//  Created by Fintech on 11/12/2022.
//

import XCTest
@testable import iOS_loginRasid

// swiftlint: disable all
class NetworkManagerTest: XCTestCase {
    

    var sut: APIClient = {
        let configurationWithMock = URLSessionConfiguration.default
        configurationWithMock.protocolClasses = [URLProtocolStub.self]
    
        return APIClient.init(configuration: configurationWithMock,
                              interceptor: nil)
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

            let login: [String: String] = [:]
            sut.request(for: AuthAPIRouter.login(loginParam: login),
                        responseType: UserEntity.self) { result in
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
    
    func testNetworkManager_whenGetValidResponse_shouldReturnValidResult() {
        let dummyURL = URL(string: "https://dummy.com")!
                
        let response = HTTPURLResponse(url: dummyURL,
                                       statusCode: 200, httpVersion: nil, headerFields: nil)
        let data = """
                    {
                        "status": true,
                        "message": "تم تسجيل الدخول بنجاح",
                        "data": {
                            "id": 214,
                            "name": "محمد السيد محمد محمد",
                            "email": "Mohamed@mail.com",
                            "image": "https://jackdashapi-develope.fintechrsa.com/images/avatar.png",
                            "country_code": "966",
                            "phone": "0503489894",
                            "whatsapp": null,
                            "is_date_hijri": false,
                            "permissions": [
                                {
                                    "global": "*"
                                }
                            ],
                            "user_type": "vendor",
                            "identity_number": "1123456789",
                            "created_at": "27 نوفمبر 2022",
                            "is_ban": false,
                            "ban_reason": null,
                            "token": "1074|3d8OS4wBJTFg1MLZXfFAsRqHGeM8nCaS0lg5yPwP",
                            "facility": {
                                "id": 8,
                                "name": "القصيم",
                                "image": "https://jackdashapi-develope.fintechrsa.com/images/avatar.png",
                                "profit_rate": 0,
                                "discount_rate": 0,
                                "transfer_financial": "أتوماتيك",
                                "is_owner": true,
                                "account_type": {
                                    "key": "commercial_record",
                                    "trans": "vendor.facility.account_types.commercial_record"
                                }
                            },
                            "settlement_transformation": "أتوماتيك"
                        }
                    }
                    """
        let remoteData = RequestResultStub(data: data.data(using: .utf8), response: response, error: nil)
        
        URLProtocolStub.stub = remoteData
        
        var serverError: Error?
        let errorExpected = expectation(description: "error")

            let login: [String: String] = [:]
            sut.request(for: AuthAPIRouter.login(loginParam: login),
                        responseType: ServerResponse<UserEntity>.self) { result in
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
            XCTAssertNil(serverError)
        }
        
    }

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
