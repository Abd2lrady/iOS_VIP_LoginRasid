//
//  LoginViewController.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

protocol IntroViewControllerProtocol: AnyObject {}

class IntroViewController: UIViewController {
    
    var interactor: IntroInteractorProtocol?
    var router: IntroRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavBar()
        
    }

    private func hideNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        router?.routeLogin()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        router?.routeRegister()
    }
    
    @IBAction func contactUsButtonAction(_ sender: Any) {
        router?.routeContactUs()
    }
    
}

extension IntroViewController: IntroViewControllerProtocol {}
