//
//  IBMCalculatorViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 22.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class BMICalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
    }
    
    @IBAction func caclulateButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! BMIResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIBalue(weight: weightSlider.value, height: heightSlider.value)
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.backgroundColor = calculatorBrain.getColor()
        }
    }
}
