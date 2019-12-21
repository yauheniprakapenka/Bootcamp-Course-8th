//
//  ViewController.swift
//  TheCompleteIOSAppDevelopmentBootcampCourse
//
//  Created by yauheni prakapenka on 15.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func dicecButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "DicesVCID")
    }
    
    @IBAction func magicBallButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "MagicBallVCID")
    }
    
    @IBAction func calculatorButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "CalculatorVCID")
    }
    
    @IBAction func xylophoneButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "XylophoneVCID")
    }
    
    @IBAction func eggsButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "EggsVCID")
    }
    
    @IBAction func quizzierButtonTapped(_ sender: UIButton) {
        presentVC(identifier: "quizzierVCID")
    }
    
    
    private func presentVC(identifier: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: identifier)
        present(vc, animated: true)
    }
}

