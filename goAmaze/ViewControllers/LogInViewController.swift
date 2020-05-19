//
//  ViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 3/26/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit
import GoogleSignIn

class LogInViewController: UIViewController,GIDSignInDelegate {
    

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
        setBordersAndDelegates()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func signInUser(_ sender: UIButton) {
        
        let user = CoreDataService.shared.fetchData()
        for i in user{
            if (i.email == userEmail.text) && (i.password == userPassword.text){
                Profile.shared.userName = i.name
                moveToMainController()
            }
            else{
                logInButton.shake()
            }
        }
    }
    
    @IBAction func registerUser(_ sender: Any) {
        let registerUserVC = RegistrationViewController.shareInstance()
        registerUserVC.modalPresentationStyle = .fullScreen
        present(registerUserVC,animated: true, completion: nil)
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        
        if let name = user.profile.givenName {
            if !name.isEmpty{
                Profile.shared.userName = name
                signInGoogleUser()
            }
        }
    }
    
    func signInGoogleUser() {
        if let name = Profile.shared.userName{
            if !name.isEmpty{
                moveToMainController()
            }
        }
    }
    
    func moveToMainController() {
        let mainController = MainContentViewController.shareInstance()
        mainController.profileName = Profile.shared.userName
        self.navigationController?.pushViewController(mainController, animated: true)
    }
    
    fileprivate func setBordersAndDelegates(){
        
        userEmail.delegate = self
        userPassword.delegate = self
        userEmail.becomeFirstResponder()
        userEmail.underline(changeColor: false)
    }
}

extension LogInViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.underline(changeColor: false)
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.underline(changeColor: true)
    }
}
