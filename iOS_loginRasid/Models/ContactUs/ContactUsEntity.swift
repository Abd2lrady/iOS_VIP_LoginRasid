//
//  ContactUsEntity.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

struct ContactUsEntity: Codable {
    let id: Int
    let name: String
    let phone: String
    let email: String
    let messageType: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, phone, email
        case messageType = "message_type"
        case message
    }
}
