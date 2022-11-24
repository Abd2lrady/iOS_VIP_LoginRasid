//
//  ContactUsRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol ContactUsRouterProtocol {
    func sendMessageTapped()
    func backButtonTapped()
}

class ContactUsRouter {
    
    weak var view: ContactUsViewControllerProtocol?
    let dataStore: ContactUsDataStore
    
    init(view: ContactUsViewControllerProtocol?,
         dataStore: ContactUsDataStore) {
        self.view = view
        self.dataStore = dataStore
    }
    
}

extension ContactUsRouter: ContactUsRouterProtocol {
    
    func sendMessageTapped() {
        print("route send message")
    }
    
    func backButtonTapped() {
        navToSource()
    }
    
    private func navToSource() {
        guard let navigator = (view as? ContactUsViewController)?.navigationController
        else { return }
        
        navigator.popViewController(animated: true)
    }
}
