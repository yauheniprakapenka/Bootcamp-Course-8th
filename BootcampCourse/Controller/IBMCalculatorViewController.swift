//
//  IBMCalculatorViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 22.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class IBMCalculatorViewController: UIViewController {
    
    var bmiResult: Float = 0.0
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! IBMResultViewController
            destinationVC.bmiValue = bmiResult
        }
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
    }
    
    @IBAction func caclulateButtonTapped(_ sender: UIButton) {
        bmiResult = weightSlider.value / pow(heightSlider.value, 2)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
}
