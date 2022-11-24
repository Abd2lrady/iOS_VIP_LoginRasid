//
//  IntroPresenter.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import Foundation

protocol IntroPresenterProtocol { }

class IntroPresenter {
    weak var view: IntroViewControllerProtocol?
    
    init(view: IntroViewControllerProtocol?) {
        self.view = view
    }
}

extension IntroPresenter: IntroPresenterProtocol { }
