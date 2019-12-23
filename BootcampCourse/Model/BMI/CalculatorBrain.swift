//
//  CalculatorBrain.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMIModel?
    
    mutating func getBMIBalue(weight: Float, height: Float) -> Float {
        let result = weight / pow(height, 2)
        
        switch result {
        case ..<18.5:
            bmi = BMIModel(value: result, advice: "Eat more pies 🍕", color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
        case 18.5...24.9:
            bmi = BMIModel(value: result, advice: "Nice! 🏀", color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
        case 25...:
            bmi = BMIModel(value: result, advice: "Eat less pies 🍏", color: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))
        default:
            print("Not found")
        }
        
        return result
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Advice not found"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
 
