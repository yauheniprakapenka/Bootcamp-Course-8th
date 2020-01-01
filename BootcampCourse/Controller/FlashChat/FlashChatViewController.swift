//
//  FlashChatViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 31.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import Firebase

class FlashChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flash chat"

        tableView.delegate = self
        tableView.dataSource = self
        
        messageTextField.delegate = self
        
        tableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableView.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func logOutButtonTapped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("sign out error")
        }
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    @objc func tableViewTapped() {
        view.endEditing(true)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FlashChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        let messageArray = ["First message", "Second message", "Third message"]
        cell.messageLabel.text = messageArray[indexPath.row]
        cell.messageLabel?.numberOfLines = 0
        cell.avatarImageView.image = #imageLiteral(resourceName: "soft_egg")

        return cell
    }
}

// MARK: - UITextViewDelegate

extension FlashChatViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
}
