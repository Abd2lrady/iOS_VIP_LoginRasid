//
//  URLProtocolStub.swift
//  iOS_loginRasidTests
//
//  Created by Fintech on 12/12/2022.
//

import Foundation

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
            print(response)
        }
        
        if let error = stub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {   }
}
