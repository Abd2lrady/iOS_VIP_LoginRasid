//
//  APIRouterProtocol.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol APIRouterProtocol {
    var scheme: NetworkRequestScheme { get }
    var baseURL: String { get }
    var path: String { get }
    var method: NetworkRequestMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any] { get }
}

enum NetworkRequestScheme: String {
    case HTTP = "http"
    case HTTPS = "https"
}

enum NetworkRequestMethod: String {
    case get = "GET"
    case post = "POST"
}
