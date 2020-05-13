//
//  RegistrationViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 3/26/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var newAccountLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var setPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBordersAndDelegates()
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpUser(_ sender: Any) {
        guard let name = userNameField.text , let email = userEmailField.text, let passwd = setPasswordField.text else { return }
        CoreDataService.shared.saveData(name: name, email: email, password: passwd)
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func setBordersAndDelegates(){
        
        loginButton.drawBorder()
        userNameField.delegate = self
        userEmailField.delegate = self
        setPasswordField.delegate = self
        confirmPasswordField.delegate = self
        newAccountLabel.underline()
        userNameField.underline(changeColor: false)
        userEmailField.underline(changeColor: false)
        setPasswordField.underline(changeColor: false)
        confirmPasswordField.underline(changeColor: false)
        alertView.isHidden = true
        signUpButton.isUserInteractionEnabled = false
    }
}


extension RegistrationViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
       if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
       } else {
            textField.resignFirstResponder()
       }
        textField.underline(changeColor: false)
       return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.underline(changeColor: true)
        confirmPasswordField.text != setPasswordField.text ? (alertView.isHidden = false) : (alertView.isHidden = true)
        
        if confirmPasswordField.text != setPasswordField.text{
            alertView.isHidden = false
            signUpButton.isUserInteractionEnabled = false
        }else{
            alertView.isHidden = true
            signUpButton.isUserInteractionEnabled = true
        }
    }
}

extension RegistrationViewController{
    static func shareInstance() -> RegistrationViewController{
        RegistrationViewController.instantiateFromStoryboard()
    }
}
