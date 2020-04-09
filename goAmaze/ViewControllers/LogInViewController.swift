//
//  ViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 3/26/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
import GoogleSignIn

class LogInViewController: UIViewController {
    
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var registerUserButton: UIButton!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        setBordersAndDelegates()
    }
    
    
    @IBAction func signInUser(_ sender: UIButton) {
     
        let user = CoreDataService.shared.fetchData()
        for i in user{
            if (i.email == userEmail.text) && (i.password == userPassword.text){
                self.dismiss(animated: true, completion: nil)
                return
            }else{
                print("Invalid Credentials")
                return
            }
        }
    }
    
    @IBAction func registerUser(_ sender: Any) {
        let registerUserVC = RegistrationViewController.shareInstance()
        registerUserVC.modalPresentationStyle = .fullScreen
        present(registerUserVC,animated: true, completion: nil)
    }
    
    
    fileprivate func setBordersAndDelegates(){
        
        userEmail.delegate = self
        userPassword.delegate = self
        logInLabel.underline()
        userEmail.underline(changeColor: false)
        userPassword.underline(changeColor: false)
        registerUserButton.drawBorder()
    }
}

extension LogInViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.underline(changeColor: false)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        textField.underline(changeColor: true)
    }
}

extension LogInViewController{
    static func shareInstance() -> LogInViewController{
        LogInViewController.instantiateFromStoryboard()
    }
}
