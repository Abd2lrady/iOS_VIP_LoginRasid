//
//  Interceptor.swift
//  iOS_loginRasid
//
//  Created by Fintech on 28/11/2022.
//

import Foundation
import Alamofire

class AuthInterceptor: RequestInterceptor {
    
    let authToken: String
    let retryLimit: Int
    let retryStatusCodes: Range<Int>
    
    init(authToken: String,
         retryLimit: Int = 1,
         retryStatusCodes: Range<Int> = (400 ..< 500)) {
        self.authToken = authToken
        self.retryLimit = retryLimit
        self.retryStatusCodes = retryStatusCodes
        
    }
    
    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("en", forHTTPHeaderField: "Accept-Language")
        urlRequest.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")

        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request,
               for session: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        if request.request?.method == .get,
            request.retryCount < retryLimit {
            print(request.retryCount)
            completion(.retry)
        } else {
            completion(.doNotRetry)
        }
    }
}
