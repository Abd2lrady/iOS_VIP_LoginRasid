//
//  IntroConfigurator.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

class IntroConfigurator {
    
    static func configure() -> UIViewController {
        
        let view = IntroViewController()
        let repo = AuthRepo()
        let presenter = IntroPresenter(view: view)
        let interactor = IntroInteractor(presenter: presenter,
                                         repo: repo)
        let router = IntroRouter(view: view,
                                 dataStore: interactor)
        view.interactor = interactor
        view.router = router
        return view
    }
}
