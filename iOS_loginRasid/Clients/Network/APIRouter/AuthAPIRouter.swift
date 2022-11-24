//
//  LoginAPIRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation
import Alamofire

typealias LoginParameters = [String: String]

enum AuthAPIRouter {
    case login(loginParam: LoginParameters)
}

extension AuthAPIRouter: APIRouterProtocol {
    var scheme: NetworkRequestScheme {
        return .HTTPS
    }
    
    var baseURL: String {
        return Constants.API.Rasid.baseURL
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/vendor/login"
        }
    }
    
    var method: NetworkRequestMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
            return ["Accept": "Application/json"]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .login(let loginParam):
            return loginParam
        }
    }
}

extension AuthAPIRouter: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = baseURL
        urlComponents.path = path
        
        guard let url = urlComponents.url
        else { fatalError("can`t get url \(urlComponents.string ?? " not founded ")") }
        
        var request = URLRequest(url: url)
        request.method = HTTPMethod(rawValue: method.rawValue)
        
        switch self {
        case .login(let param):
            request = try JSONParameterEncoder().encode(param, into: request)
        }
    
        return request
    }
}
