//
//  CalculatorBrain.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    func getBMIBalue(weight: Float, height: Float) -> Float {
        return weight / pow(height, 2)
    }
}
