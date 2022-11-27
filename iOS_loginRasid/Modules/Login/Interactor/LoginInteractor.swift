//
//  LoginInteractor.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

protocol LoginInteractorProtocol {
    func interact(request: LoginModel.Request)
}
protocol LoginDataStore {
    var user: UserEntity? { get }
}

class LoginInteractor {
    
    let presenter: LoginPresenterProtocol
    let repo: AuthGateway
    var user: UserEntity?
    
    init(presenter: LoginPresenterProtocol,
         repo: AuthGateway) {
        self.presenter = presenter
        self.repo = repo
    }
    
}

extension LoginInteractor: LoginInteractorProtocol {
    func interact(request: LoginModel.Request) {
        switch request {
        case .login(let credentails):
            login(credentials: credentails)
        }
    }
    
    private func login(credentials: LoginCredentials) {
        repo.login(credentials: credentials) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

extension LoginInteractor: LoginDataStore { }
