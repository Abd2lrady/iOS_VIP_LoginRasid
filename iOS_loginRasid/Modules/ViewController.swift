//
//  ViewController.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.test.color
        
        let credentials = LoginCredentials(username: "1234965878",
                                           password: "Mm@123456")
        
//        let loginParam = ["username": "1123456789", "password": "Mm@12345"]
   
        AuthRepo().login(credentials: credentials) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
