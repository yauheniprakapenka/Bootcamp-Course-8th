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
        messageTextField.attributedPlaceholder = NSAttributedString(string: "Сообщение", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6343232393, green: 0.6631767154, blue: 0.6889144778, alpha: 1)])
        
        tableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        retrieveMessages()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableView.addGestureRecognizer(tapGesture)
        
        tableView.separatorStyle = .none
        
        showLastMessage()
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
    
    private func showLastMessage() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            let count = self.messageArray.count
            if count > 0 {
                let indexPath = IndexPath(row: self.messageArray.count - 1, section: 0)
                self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            }
            
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
        
        if cell.namelabel.text! == Auth.auth().currentUser?.email! {
            cell.messageBackgroundView.backgroundColor = #colorLiteral(red: 0.2698300481, green: 0.2745030522, blue: 0.2831587195, alpha: 1)
            cell.avatarImageView.alpha = 0
        } else {
            cell.messageBackgroundView.backgroundColor = #colorLiteral(red: 0.1717960536, green: 0.1764581203, blue: 0.1851234138, alpha: 1)
            cell.avatarImageView.image = #imageLiteral(resourceName: "spiderman")
            cell.avatarImageView.alpha = 1
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
