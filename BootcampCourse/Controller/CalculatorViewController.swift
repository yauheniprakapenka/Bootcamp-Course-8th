//
//  CalculatorViewController.swift
//  TheCompleteIOSAppDevelopmentBootcampCourse
//
//  Created by yauheni prakapenka on 18.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var isFinishedTypingNumber = true
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        isFinishedTypingNumber = true
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = sender.currentTitle
                isFinishedTypingNumber = false
            } else {
                displayLabel.text! += numValue
            }
            
        }
    }
    
}
