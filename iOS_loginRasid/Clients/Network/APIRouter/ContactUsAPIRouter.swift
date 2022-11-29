//
//  ContactUsAPIRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation
import Alamofire

//enum ContactUsAPIRouter {
//    case sendForm(form: [String: String])
//    case getMesageTypes
//}
////
//extension ContactUsAPIRouter: APIRouterProtocol & URLRequestConvertible {
//
//    var path: String {
//        switch self {
//        case .sendForm:
//            return "messages"
//        case .getMesageTypes:
//            return "list_message_types"
//        }
//    }
//
//    var method: NetworkRequestMethod {
//        switch self {
//        case .sendForm:
//            return .post
//        case .getMesageTypes:
//            return .get
//        }
//    }
//
//    var parameters: [String: String] {
//        switch self {
//        case .sendForm(let param):
//            return param
//        case .getMesageTypes:
//            return [:]
//        }
//    }
//}

enum ContactUsAPIRouter: URlRequestConvertable {
    case sendForm(form: [String: String])
    case getMesageTypes
    
    var path: String {
        switch self {
        case .sendForm:
             return "messages"
        case .getMesageTypes:
             return "list_message_types"
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
    
    var parameters: [String: String] {
        switch self {
        case .sendForm(let form):
            return form
        case .getMesageTypes:
            return [:]
        }
    }
    
}
