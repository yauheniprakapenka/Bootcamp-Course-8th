//
//  TodoListViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 02.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    @IBOutlet var todoListTableView: UITableView!
    
    let itemArray = ["Find Mike", "buy Eggos", "Destroy demogorgon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        todoListTableView.delegate = self
//        todoListTableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
}
