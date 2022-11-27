//
//  LoginConfigurator.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import UIKit

class LoginConfigurator {
    
    static func configure() -> UIViewController {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view)
        let repo = AuthRepo()
        let interactor = LoginInteractor(presenter: presenter,
                                         repo: repo)
        let router = LoginRouter(view: view,
                                 dataStore: interactor)
        view.interactor = interactor
        view.router = router
        
        return view
    }
}
