//
//  ContactUsInteractor.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol ContactUsInteractorProtocol { }
protocol ContactUsDataStore { }

class ContactUsInteractor {
    
    let presenter: ContactUsPresenterProtocol
    let repo: AuthGateway
    
    init(presenter: ContactUsPresenterProtocol, repo: AuthGateway) {
        self.presenter = presenter
        self.repo = repo
    }
    
}

extension ContactUsInteractor: ContactUsInteractorProtocol, ContactUsDataStore { }
