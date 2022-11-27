//
//  LoginRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

protocol LoginRouterProtocol {
    func backButtonTapped()
}

class LoginRouter {
    
    weak var view: LoginViewControllerProtocol?
    var dataStore: LoginDataStore
    
    init(view: LoginViewControllerProtocol,
         dataStore: LoginDataStore) {
        self.view = view
        self.dataStore = dataStore
    }
}

extension LoginRouter: LoginRouterProtocol {
    func backButtonTapped() {
        guard let navigator = (view as? LoginViewController)?.navigationController
        else { return }
        navigator.popViewController(animated: true)
    }
    

}
