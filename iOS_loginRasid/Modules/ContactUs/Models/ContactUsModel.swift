//
//  ContactUsModel.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

enum ContanctUsModel {
    
    enum Request {
        case send(ContactUsForm)
        case viewLoaded
    }
    
    enum Response {
        case messageType([MessageTypesEntity])
    }
    
    struct ViewModel {
        let messageTypes: [String]
    }
    
    struct ContactUsForm {
        let customerName: String
        let phoneNumber: String
        let messageType: Int
        let message: String
        let email: String
        
        func getParams() -> [String: String] {
            return ["name": customerName,
                    "phone": phoneNumber,
                    "message_type_id": "\(messageType)",
                    "message": message,
                    "email": email]
        }
    }
}
