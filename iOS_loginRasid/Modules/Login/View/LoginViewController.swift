//
//  LoginViewController.swift
//  iOS_loginRasid
//
//  Created by Fintech on 27/11/2022.
//

import UIKit

protocol LoginViewControllerProtocol: AnyObject { }

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        configNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    func configNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.titleView = UIImageView(image: Images.logoIc.image)
        
        let backButton = UIButton()
        backButton.setBackgroundImage(Images.backIc.image,
                                      for: .normal)
        backButton.addTarget(self,
                             action: #selector(backButtonItemAction),
                             for: .touchUpInside)
        let leftItem = UIBarButtonItem(customView: backButton)
        navigationItem.leftBarButtonItem = leftItem
    }

    @objc
    func backButtonItemAction() {
        router?.backButtonTapped()
    }

    @IBAction func toggleShowPasswordButtonAction(_ sender: Any) {
        
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func forgetPasswordButtonAction(_ sender: Any) {
        print("forgetPassword button tapped")

    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        print("login button tapped")
        
        guard let username = usernameTextField.text,
              let password = passwordTextField.text
        else { return }
        
        let credentials = LoginCredentials(username: username, password: password)
        interactor?.interact(request: .login(credentails: credentials))
    }
    
    @IBAction func fingerPrintButtonAction(_ sender: Any) {
        print("fingerPrint button tapped")
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        print("register button tapped")
    }
    
}

extension LoginViewController: LoginViewControllerProtocol { }
