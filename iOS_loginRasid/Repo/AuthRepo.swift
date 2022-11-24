//
//  AuthRepo.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

class AuthRepo: AuthGateway {
    
    private let client: APIClient
    
    init(client: APIClient = APIClient.shared) {
        self.client = client
    }
    
    func login(credentials: LoginCredentials,
               completionHandler: @escaping (Result<ServerResponse<UserEntity>, Error>) -> Void) {
        
        client.request(for: AuthAPIRouter.login(loginParam: credentials.getparams()),
                       responseType: ServerResponse<UserEntity>.self,
                       completionHandler: completionHandler)
    }
    
}
