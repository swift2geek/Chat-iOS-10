//
//  SignInVC.swift
//  Chat iOS 10
//
//  Created by Vladimir Valter on 22/01/2017.
//  Copyright © 2017 Vladimir Valter. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    private let CONTACTS_SEGUE = "ContactsSegue"
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthProvider.Instance.isLoggedIn() {
            performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil);
        }
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem With Authentication", message: message!)
                } else {
                    
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                    
                }
                
            })
            
        } else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields")
        }
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            AuthProvider.Instance.signUp(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
             
                if message != nil {
                    self.alertTheUser(title: "Problem With Creating A New User", message: message!)
                    
                } else {
                    
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                    self.performSegue(withIdentifier: self.CONTACTS_SEGUE, sender: nil)
                }
                
            })
         
            
        } else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields")
        }
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
} //class






















