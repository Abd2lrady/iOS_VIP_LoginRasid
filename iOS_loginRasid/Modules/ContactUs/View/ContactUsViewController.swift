//
//  ContactUsViewController.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

protocol ContactUsViewControllerProtocol: AnyObject {
    
    func show(messageTypes: [String])
}

class ContactUsViewController: UIViewController {

    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var messageTypeTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    let pickerView = UIPickerView()
    var interactor: ContactUsInteractorProtocol?
    var router: ContactUsRouterProtocol?
    var messageTypes = [String]()
    var selectedMessageRow: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        pickerView.delegate = self
        messageTypeTextField.inputView = pickerView
        interactor?.interact(request: .viewLoaded)
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
    
    @IBAction func sendButtonAction(_ sender: Any) {
        
        guard let name = customerNameTextField.text,
              let phone = phoneNumberTextField.text,
              let message = messageTextField.text,
              let email = emailTextField.text
        else { return }
        
        let messageTypeId = router?.getMessageTypeId(for: selectedMessageRow)
        let form = ContanctUsModel.ContactUsForm(customerName: name,
                                                 phoneNumber: phone,
                                                 messageType: messageTypeId ?? 0,
                                                 message: message,
                                                 email: email)
        interactor?.interact(request: .send(form))
    }
    
}

extension ContactUsViewController: ContactUsViewControllerProtocol {
    
    func show(messageTypes: [String]) {
        self.messageTypes = messageTypes
        pickerView.reloadAllComponents()
    }
    
}

extension ContactUsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        messageTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    attributedTitleForRow row: Int,
                    forComponent component: Int) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: Fonts.Cairo.regular.font(size: 16)]
                
        return NSAttributedString(string: messageTypes[row].localize,
                                  attributes: attributes)
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        messageTypeTextField.resignFirstResponder()
        selectedMessageRow = row
        messageTypeTextField.text = messageTypes[row].localize
    }
}
