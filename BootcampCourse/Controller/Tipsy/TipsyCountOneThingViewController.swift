//
//  TipsyCountOneThingViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 29.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class TipsyCountOneThingViewController: UIViewController {
    
    @IBOutlet weak var valueGoodsTextField: UITextField!
    @IBOutlet weak var valueCostTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueCostTextField.delegate = self
        valueGoodsTextField.delegate = self
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        valueGoodsTextField.text = ""
        valueCostTextField.text = ""
    }
    
    private func caclulate() -> String {
        let value = Double(valueGoodsTextField.text!)
        let cost = Double(valueCostTextField.text!)
        
        return String(format: "%.2f", 1 * (cost ?? 0) / (value ?? 0))
    }
}

extension TipsyCountOneThingViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        resultLabel.text = caclulate()
    }
}

