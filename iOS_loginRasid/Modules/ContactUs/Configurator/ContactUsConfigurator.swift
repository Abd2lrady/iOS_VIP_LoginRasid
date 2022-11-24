//
//  ContactUsConfigurator.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

class ContactUsConfigurator {
    
    static func configure() -> UIViewController {
        let view = ContactUsViewController()
        let presenter = ContactUsPresenter(view: view)
        let repo = AuthRepo()
        let interactor = ContactUsInteractor(presenter: presenter,
                                             repo: repo)
        let router = ContactUsRouter(view: view, dataStore: interactor)
        view.interactor = interactor
        view.router = router
        return view
    }
}
