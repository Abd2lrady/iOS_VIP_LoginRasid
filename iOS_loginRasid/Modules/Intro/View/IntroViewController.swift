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
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        router?.loginTapped()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        router?.registerTapped()
    }
    
    @IBAction func contactUsButtonAction(_ sender: Any) {
        router?.contactUsTapped()
    }
    
}

extension IntroViewController: IntroViewControllerProtocol {}
