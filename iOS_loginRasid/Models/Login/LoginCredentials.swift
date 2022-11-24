//
//  LoginCredentials.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation
struct LoginCredentials {
    
    let username: String
    let password: String
    
    func getparams() -> [String: String] {
        return ["username": username, "password": password]
    }
    
}
