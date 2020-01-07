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
    
    private var isFinishedTypingNumber = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {

        isFinishedTypingNumber = true
            
        if let calcMethod = sender.currentTitle {
            switch calcMethod {
            case "+/-":
                displayValue *= -1
            case "AC":
                displayLabel.text = "0"
            case "%":
                displayValue *= 0.01
            default:
                fatalError("Unknown calc method")
            }
        }
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        if let numberValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numberValue
                isFinishedTypingNumber = false
            } else {
                if numberValue == "." {
                  
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text! += numberValue
            }
        }
    }
}
