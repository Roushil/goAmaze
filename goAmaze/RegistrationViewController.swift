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
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userMobileNumber: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBordersAndDelegates()
    }
    
    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func setBordersAndDelegates(){
        
        loginButton.drawBorder()
        newAccountLabel.underline()
        userName.underline(changeColor: false)
        userMobileNumber.underline(changeColor: false)
        userEmail.underline(changeColor: false)
        userPassword.underline(changeColor: false)
        userName.delegate = self
        userMobileNumber.delegate = self
        userEmail.delegate = self
        userPassword.delegate = self
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
    }
}
