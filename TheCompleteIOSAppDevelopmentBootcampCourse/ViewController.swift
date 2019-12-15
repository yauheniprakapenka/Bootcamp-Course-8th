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
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "DicesViewController") as! DicesViewController
        present(vc, animated: true)
    }
}

