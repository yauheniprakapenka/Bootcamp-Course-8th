//
//  IBMResultViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class BMIResultViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = String(format: "%.1f", bmiValue!)
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
