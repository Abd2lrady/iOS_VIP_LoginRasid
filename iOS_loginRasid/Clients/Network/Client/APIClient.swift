//
//  NetworkClient.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import Foundation
import Alamofire

typealias APIRouterProtocolAndConvertible = APIRouterProtocol & URLRequestConvertible

enum APIError: Error {
    case noStatusCode
    case unauthorized
    case genericError(Int)
}

class APIClient {
    
    static let shared = APIClient()
    
    private init() {}
    
    func request<ResponseType: Codable>(for endpoint: APIRouterProtocolAndConvertible,
                                        responseType: ResponseType.Type,
                                        completionHandler: @escaping (Result<ResponseType, Error>) -> Void ) {
        
        guard let url = try? endpoint.asURLRequest() else { fatalError("can`t get url") }
        AF.request(url).responseData { response in
            
            guard let statusCode = response.response?.statusCode
            else {
                completionHandler(.failure(APIError.noStatusCode))
                return
            }
            switch response.result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(ResponseType.self, from: data)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
