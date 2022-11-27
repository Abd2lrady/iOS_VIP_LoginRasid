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
        
        client.request(for: AuthAPIRouter.login(loginParam: credentials.getParams()),
                       responseType: ServerResponse<UserEntity>.self,
                       completionHandler: completionHandler)
    }
    
    func sendContactUsForm(form: ContanctUsModel.ContactUsForm,
                           completionHandler: @escaping (Result<ServerResponse<ContactUsEntity>, Error>) -> Void) {
        client.request(for: ContactUsAPIRouter.sendForm(form: form.getParams()),
                       responseType: ServerResponse<ContactUsEntity>.self,
                       completionHandler: completionHandler)

    }
    
    func getMessageTypes(completionHandler: @escaping (Result<ServerResponse<[MessageTypesEntity]>, Error>) -> Void) {
        client.request(for: ContactUsAPIRouter.getMesageTypes,
                       responseType: ServerResponse<[MessageTypesEntity]>.self,
                       completionHandler: completionHandler)

    }

}
