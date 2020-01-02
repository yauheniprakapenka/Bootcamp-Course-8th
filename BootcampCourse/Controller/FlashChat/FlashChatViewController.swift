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
    
    private var messageArray = [MessageModel]()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flash chat"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        messageTextField.delegate = self
        
        tableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        retrieveMessages()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableView.addGestureRecognizer(tapGesture)
        
        tableView.separatorStyle = .none
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        let messageDB = Database.database().reference().child("Messages")
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                                 "MessageBody": messageTextField.text!]
        
        messageDB.childByAutoId().setValue(messageDictionary) { (error, reference) in
            if error != nil {
                print(error!)
            } else {
                print("Message saved succesfully")
                self.messageTextField.text = ""
                self.view.endEditing(true)
            }
        }
    }
    
    @IBAction func logOutButtonTapped(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("sign out error")
        }
    }
    
    @objc func tableViewTapped() {
        view.endEditing(true)
    }
    
    private func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func retrieveMessages() {
        let messageDB = Database.database().reference().child("Messages")
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let sender = snapshotValue["Sender"]!
            let messageBody = snapshotValue["MessageBody"]!
            
            let message = MessageModel()
            message.messageBody = messageBody
            message.sender = sender
            self.messageArray.append(message)
            
            self.configureTableView()
            self.tableView.reloadData()
            
            print(sender, messageBody)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FlashChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.namelabel.text = messageArray[indexPath.row].sender
        cell.messageLabel.text = messageArray[indexPath.row].messageBody
        cell.avatarImageView.image = #imageLiteral(resourceName: "soft_egg")
        
        if cell.namelabel.text! == Auth.auth().currentUser?.email! {
            cell.avatarImageView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            cell.messageBackgroundView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        } else {
            cell.avatarImageView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            cell.messageBackgroundView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }

        return cell
    }
}

// MARK: - UITextViewDelegate

extension FlashChatViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2) {
            self.heightConstraint.constant = 320
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.19) {
            self.heightConstraint.constant = 70
            self.view.layoutIfNeeded()
        }
    }
}
