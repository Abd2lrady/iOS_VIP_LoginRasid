//
//  NetworkStubs.swift
//  iOS_loginRasidTests
//
//  Created by Fintech on 12/12/2022.
//

import Foundation
import Alamofire

@testable import iOS_loginRasid
// swiftlint: disable all

struct DummyResponseType: Codable, Equatable {
    let id: Int?
    let userName: String?
    
    func getBody() -> [String: Any] {
        return ["userName": userName,
                "id": id]
    }
}

struct RequestResultStub {
    let data: Data?
    let response: URLResponse?
    let error: Error?
}


enum DummyEndPointRouter: URlRequestConvertable {
    
    var path: String {
        "dummyPath"
    }
    
    var method: iOS_loginRasid.NetworkRequestMethod {
        .get
    }
    
    var parameters: [String : String] {
        [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "https://dummyHost.com")
        return try! URLRequest(url: url!, method: HTTPMethod(rawValue: method.rawValue))
    }
    
    case dummyCase
}



class InterceptorSpy: AuthInterceptor {
    var retryCount: Int?
    var token: String?
    
    override func adapt(_ urlRequest: URLRequest,
                        for session: Session,
                        completion: @escaping (Result<URLRequest, Error>) -> Void) {
        
        super.adapt(urlRequest, for: session) { res in
            switch res {
            case .success(let request):
                completion(.success(request))
                self.token = request.headers.value(for: "Authorization")
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
    
    override func retry(_ request: Request,
                        for session: Session,
                        dueTo error: Error,
                        completion: @escaping (RetryResult) -> Void) {
        self.retryCount = request.retryCount
        super.retry(request, for: session, dueTo: error, completion: completion)
    }
}
