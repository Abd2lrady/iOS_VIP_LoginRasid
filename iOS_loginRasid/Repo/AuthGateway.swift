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
    
    func sendContactUsForm(form: ContanctUsModel.ContactUsForm,
                           completionHandler: @escaping (Result<ServerResponse<ContactUsEntity>, Error>) -> Void)
    
    func getMessageTypes(completionHandler: @escaping (Result<ServerResponse<[MessageTypesEntity]>, Error>) -> Void) 

}
