//
//  IntroInteractor.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol IntroInteractorProtocol { }
protocol IntroDataStore { }
class IntroInteractor {
    
    let presenter: IntroPresenterProtocol
    let repo: AuthGateway
    
    init(presenter: IntroPresenterProtocol, repo: AuthGateway) {
        self.presenter = presenter
        self.repo = repo
    }
    
}

extension IntroInteractor: IntroInteractorProtocol, IntroDataStore { }
