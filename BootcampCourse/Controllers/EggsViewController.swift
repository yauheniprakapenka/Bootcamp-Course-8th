//
//  EggsViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 19.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class EggsViewController: UIViewController {
    
    let softTime = 3
    let mediumTime = 6
    let hardTime = 9
    
    @IBAction func eggButtonTapped(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        if hardness == "Soft" {
            print(softTime)
        } else if hardness == "Medium" {
            print(mediumTime)
        } else if hardness == "Hard" {
            print(hardTime)
        }
    }
    
}
