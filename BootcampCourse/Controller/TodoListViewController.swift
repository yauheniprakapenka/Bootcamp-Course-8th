//
//  TodoListViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 02.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Find Mike", "buy Eggos", "Destroy demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            return
        }
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
