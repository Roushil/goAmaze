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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBordersAndDelegates()
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpUser(_ sender: Any) {
        
    }
    fileprivate func setBordersAndDelegates(){
        
        loginButton.drawBorder()
        userNameField.delegate = self
        userEmailField.delegate = self
        setPasswordField.delegate = self
        confirmPasswordField.delegate = self
        userNameField.underline(changeColor: false)
        userEmailField.underline(changeColor: false)
        setPasswordField.underline(changeColor: false)
        confirmPasswordField.underline(changeColor: false)
        alertView.isHidden = true
    }
}


extension RegistrationViewController: UITextFieldDelegate{
    
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.underline(changeColor: false)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
            
        textField.underline(changeColor: true)
        confirmPasswordField.text != setPasswordField.text ? (alertView.isHidden = false) : (alertView.isHidden = true)
    }
}
