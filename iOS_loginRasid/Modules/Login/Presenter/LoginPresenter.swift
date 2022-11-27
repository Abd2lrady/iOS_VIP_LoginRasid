//
//  LoginPresenter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import Foundation

protocol LoginPresenterProtocol { }

class LoginPresenter {
    weak var view: LoginViewControllerProtocol?
    
    init(view: LoginViewControllerProtocol) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterProtocol { }
