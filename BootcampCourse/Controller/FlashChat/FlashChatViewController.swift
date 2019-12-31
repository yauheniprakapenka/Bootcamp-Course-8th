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
    
    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flash chat"

        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        messageTableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
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
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 100
        
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension FlashChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        let messageArray = ["First message message mmessage messagemessage messagemessage messageessagmessage messagemessage messagemessage messagee message", "Second message message message message", "Thied message message message message message"]
        cell.messageLabel.text = messageArray[indexPath.row]
        cell.messageLabel?.numberOfLines = 0
        cell.avatarImageView.image = #imageLiteral(resourceName: "soft_egg")

        return cell
    }
}
