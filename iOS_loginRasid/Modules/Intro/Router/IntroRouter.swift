//
//  IntroRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol IntroRouterProtocol {
    func loginTapped()
    func contactUsTapped()
    func registerTapped()
}

class IntroRouter {
    
    weak var view: IntroViewControllerProtocol?
    let dataStore: IntroDataStore
    
    init(view: IntroViewControllerProtocol?,
         dataStore: IntroDataStore) {
        self.view = view
        self.dataStore = dataStore
    }
    
}

extension IntroRouter: IntroRouterProtocol {
    
    func loginTapped() {
        print("route login")
    }
    
    func contactUsTapped() {
        print("route contactUs")
        navToContactUs()
    }
    
    func registerTapped() {
        print("route Register")
    }
    
    private func navToContactUs() {
        
        guard let navigator = (view as? IntroViewController)?.navigationController
        else { return }
        
        let view = ContactUsConfigurator.configure()
        navigator.pushViewController(view,
                                     animated: true)
    }

}
