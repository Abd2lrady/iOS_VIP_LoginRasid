//
//  ContactUsPresenter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol ContactUsPresenterProtocol {
    func present(response: ContanctUsModel.Response)
}

class ContactUsPresenter {
    weak var view: ContactUsViewControllerProtocol?
    
    init(view: ContactUsViewControllerProtocol?) {
        self.view = view
    }
}

extension ContactUsPresenter: ContactUsPresenterProtocol {
    func present(response: ContanctUsModel.Response) {
        switch response {
        case .messageType(let messageTypes):
            
            let viewModels = messageTypes.map { entity in
                entity.name
            }
            view?.show(messageTypes: viewModels)
        }
    }
    
}
