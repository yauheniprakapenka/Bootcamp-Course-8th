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
    @IBOutlet weak var passwordTextFField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSegue(withIdentifier: "goToChat", sender: self)
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextFField.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Registration successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}
