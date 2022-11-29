//
//  LoginAPIRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation
import Alamofire

typealias LoginParameters = [String: String]
//
//enum AuthAPIRouter {
//    case login(loginParam: LoginParameters)
//}
//
//extension AuthAPIRouter: APIRouterProtocol & URLRequestConvertible {
//
//    var path: String {
//        switch self {
//        case .login:
//            return "login"
//        }
//    }
//
//    var method: NetworkRequestMethod {
//        switch self {
//        case .login:
//            return .post
//        }
//    }
//
//    var parameters: [String: String] {
//        switch self {
//        case .login(let loginParam):
//            return loginParam
//        }
//    }
//}


enum AuthAPIRouter: URlRequestConvertable {
    case login(loginParam: LoginParameters)
    
    var path: String {
        switch self {
        case .login:
            return "login"
        }
    }
    
    var method: NetworkRequestMethod {
        switch self {
        case .login:
            return .get
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .login(let loginParam):
            return loginParam
        }
    }
    
}
