//
//  DestinyViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 22.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class DestinyViewController: UIViewController {
    
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var storyTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButtons()
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        print(#function)
    }
    
    private func configButtons() {
        choiceOneButton.layer.cornerRadius = 20
        choiceTwoButton.layer.cornerRadius = 20
    }
    
}
