//
//  FlashChatLoginViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 31.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import Firebase

class FlashChatLoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.text = "test@testdk.by"
        passwordTextField.text = "123456"
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authDataResult, error) in
            if error != nil {
                print(error!)
            } else {
                print("signIn successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
}
