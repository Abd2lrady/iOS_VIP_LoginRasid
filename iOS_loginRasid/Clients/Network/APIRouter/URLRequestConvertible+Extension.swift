//
//  URLRequestConvertible+Extension.swift
//  iOS_loginRasid
//
//  Created by Fintech on 28/11/2022.
//

import Foundation
import Alamofire

extension URLRequestConvertible where Self: APIRouterProtocol {
    
    func asURLRequest() throws -> URLRequest {
        
        let url = URL(string: Constants.API.Rasid.baseURL)
        guard let url = url?.appendingPathComponent(path)
        else { fatalError("can`t get url \(url?.absoluteString ?? " not founded ")") }
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.method = HTTPMethod(rawValue: self.method.rawValue)
        if self.method == .post {
            request = try JSONParameterEncoder().encode(self.parameters, into: request)
        }
        return request
    }
}
