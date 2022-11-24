//
//  AuthGateway.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol AuthGateway {
    
    func login(credentials: LoginCredentials,
               completionHandler: @escaping (Result<ServerResponse<UserEntity>, Error>) -> Void)
}
