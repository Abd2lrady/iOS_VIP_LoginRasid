//
//  ContactUsPresenter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol ContactUsPresenterProtocol { }

class ContactUsPresenter {
    weak var view: ContactUsViewControllerProtocol?
    
    init(view: ContactUsViewControllerProtocol?) {
        self.view = view
    }
}

extension ContactUsPresenter: ContactUsPresenterProtocol { }
