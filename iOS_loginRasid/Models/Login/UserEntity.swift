//
//  User.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

struct UserEntity: Codable {
    let id: Int
    let token: String
    let name: String
    let email: String?
    let image: String?
}
