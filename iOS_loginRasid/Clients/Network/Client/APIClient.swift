//
//  NetworkClient.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import Foundation
import Alamofire

enum APIError: Error {
    case noStatusCode
    case unauthorized
    case genericError(Int)
}
// swiftlint: disable all
class APIClient {
    
    static let shared = APIClient()
    let session: Session
    let interceptor: RequestInterceptor?
    init(configuration: URLSessionConfiguration = .default,
         interceptor: RequestInterceptor? = AuthInterceptor(authToken: "",
                                                            retryLimit: 3,
                                                            retryStatusCodes: 400..<500)) {
        session = Alamofire.Session(configuration: configuration)
        self.interceptor = interceptor
    }
    
//    let interceptor = AuthInterceptor(authToken: "",
//                                      retryLimit: 3,
//                                      retryStatusCodes: 400..<500)
    
    func request<ResponseType: Codable>(for endpoint: URlRequestConvertable,
                                        responseType: ResponseType.Type,
                                        completionHandler: @escaping (Result<ResponseType, Error>) -> Void ) {
        
        guard let url = try? endpoint.asURLRequest() else { fatalError("can`t get url") }
        
        session.request(url, interceptor: interceptor)
            .validate()
            .responseData { response in
            debugPrint(response)
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
