//
//  ViewController.swift
//  goAmaze
//
//  Created by Roushil singla on 3/26/20.
//  Copyright © 2020 personal. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var logInLabel: UILabel!
    @IBOutlet weak var registerUserButton: UIButton!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        chickIcon.image = UIImage(named: "Icon_Chick")?.withRenderingMode(.alwaysTemplate)
//        chickIcon.tintColor = UIColor(red: 101/255, green: 195/255, blue: 102/255, alpha: 1.0)
        setBordersAndDelegates()
    }
    
    
    @IBAction func registerUser(_ sender: Any) {
        
        let registerUserVC = self.storyboard?.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
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
