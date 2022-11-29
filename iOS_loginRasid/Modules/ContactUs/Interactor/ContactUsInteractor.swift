//
//  ContactUsInteractor.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol ContactUsInteractorProtocol {
    func interact(request: ContanctUsModel.Request)
    func getMessageTypeId(for row: Int) -> Int?
}
protocol ContactUsDataStore {
    var messageTypes: [MessageTypesEntity] { get }
}

class ContactUsInteractor {
    
    let presenter: ContactUsPresenterProtocol
    let repo: AuthGateway
    var messageTypes = [MessageTypesEntity]()
    
    init(presenter: ContactUsPresenterProtocol, repo: AuthGateway) {
        self.presenter = presenter
        self.repo = repo
    }
    
}

extension ContactUsInteractor: ContactUsInteractorProtocol, ContactUsDataStore {
    func getMessageTypeId(for row: Int) -> Int? {
        if !messageTypes.isEmpty {
            return messageTypes[row].id
        }
        return nil
    }
    
    func interact(request: ContanctUsModel.Request) {
        switch request {
        case .send(let form):
            sendForm(formBody: form)
        case .viewLoaded:
            getMessageTypes()
        }
    }
    
    func sendForm(formBody: ContanctUsModel.ContactUsForm) {
        repo.sendContactUsForm(form: formBody) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getMessageTypes() {
        repo.getMessageTypes { [weak self] result in
            switch result {
            case .success(let response):
                guard let types = response.data else { return }
                self?.messageTypes = types
                self?.presenter.present(response: ContanctUsModel.Response.messageType(types))
            case .failure(let error):
                print(error)
            }
        }
    }
}
