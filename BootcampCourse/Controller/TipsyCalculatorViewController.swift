//
//  TipsyCalculatorViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class TipsyCalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var numberOfPersonLabel: UILabel!
    
    private var tipPercentage = ""
    private var tipsyBrain = TipsyBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let buttons = [zeroPctButton, tenPctButton, twentyPctButton]
        
        for button in buttons {
            button?.isSelected = false
            button?.setTitleColor(#colorLiteral(red: 0.3001423431, green: 0.712215648, blue: 0.4236614959, alpha: 1), for: .normal)
        }
        
        sender.isSelected = true
        sender.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        tipPercentage = sender.currentTitle ?? ""
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPersonLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        
        guard let bill = billTextField.text, bill != "" else {
            return
        }
        
        let result = tipsyBrain.getBillForOnePerson(totalBill: billTextField.text ?? "", percent: String(tipPercentage.dropLast()), numberOfPerson: numberOfPersonLabel.text!)
    }
    
}
