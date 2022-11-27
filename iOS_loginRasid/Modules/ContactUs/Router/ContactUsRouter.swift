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
    func getMessageTypeId(for row: Int) -> Int
}

class ContactUsRouter {
    
    weak var view: ContactUsViewControllerProtocol?
    let dataStore: ContactUsDataStore
    
    init(view: ContactUsViewControllerProtocol?,
         dataStore: ContactUsDataStore) {
        self.view = view
        self.dataStore = dataStore
    }
    
    func getMessageTypeId(for row: Int) -> Int {
        dataStore.messageTypes[row].id
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
