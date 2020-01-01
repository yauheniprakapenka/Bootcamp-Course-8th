//
//  FlashChatRegisterViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 31.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import Firebase

class FlashChatRegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "test@testdk.by"
        passwordTextField.text = "123456"
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        activityIndicator.startAnimating()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
                self.activityIndicator.stopAnimating()
            } else {
                print("Registration successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
