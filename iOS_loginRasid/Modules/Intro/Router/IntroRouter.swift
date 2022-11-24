//
//  IntroRouter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol IntroRouterProtocol {
    func routeLogin()
    func routeContactUs()
    func routeRegister()
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
    
    func routeLogin() {
        print("route login")
    }
    
    func routeContactUs() {
        print("route contactUs")
    }
    
    func routeRegister() {
        print("route Register")
    }

}
