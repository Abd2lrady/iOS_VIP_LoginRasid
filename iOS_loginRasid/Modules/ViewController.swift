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
        let loginParam = ["username": "1123456789", "password": "Mm@12345"]
        APIClient.shared.request(for: AuthAPIRouter.login(loginParam: loginParam),
                                 responseType: ServerResponse<UserEntity>.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }

    }

}
