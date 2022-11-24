//
//  ContactUsViewController.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

protocol ContactUsViewControllerProtocol: AnyObject {}

class ContactUsViewController: UIViewController {

    var interactor: ContactUsInteractorProtocol?
    var router: ContactUsRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        // Do any additional setup after loading the view.
    }
    
    func configNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
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
}

extension ContactUsViewController: ContactUsViewControllerProtocol {}
