//
//  ContactUsAPIRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation
import Alamofire

enum ContactUsAPIRouter {
    case sendForm(form: [String: String])
    case getMesageTypes
}

extension ContactUsAPIRouter: APIRouterProtocol {
    var scheme: NetworkRequestScheme {
        return .HTTPS
    }
    
    var baseURL: String {
        return Constants.API.Rasid.baseURL
    }
    
    var path: String {
        switch self {
        case .sendForm:
            return "/api/vendor/messages"
        case .getMesageTypes:
            return "/api/vendor/list_message_types"
        }
    }
    
    var method: NetworkRequestMethod {
        switch self {
        case .sendForm:
            return .post
        case .getMesageTypes:
            return .get
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .sendForm, .getMesageTypes:
            return ["Accept": "application/json"]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .sendForm(let param):
            return param
        case .getMesageTypes:
            return ["": ""]
        }
    }
}

extension ContactUsAPIRouter: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = baseURL
        urlComponents.path = path
        guard let url = urlComponents.url
        else { fatalError("can`t get url \(urlComponents.string ?? " not founded ")") }
        
        var request = URLRequest(url: url)
        request.method = HTTPMethod(rawValue: method.rawValue)
        request.headers = HTTPHeaders(headers ?? [:])
 
        switch self {
        case .sendForm(let param):
            request = try JSONParameterEncoder().encode(param, into: request)
        
        case .getMesageTypes:
            print("get message")
        }
    
        return request
    }
}
