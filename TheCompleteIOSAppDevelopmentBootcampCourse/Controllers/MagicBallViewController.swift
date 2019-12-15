//
//  MagicBallViewController.swift
//  TheCompleteIOSAppDevelopmentBootcampCourse
//
//  Created by yauheni prakapenka on 15.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class MagicBallViewController: UIViewController {
    
    @IBOutlet weak var magicBallImageView: UIImageView!
    
    let ballsArray = [#imageLiteral(resourceName: "ball1"), #imageLiteral(resourceName: "ball2"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball4"), #imageLiteral(resourceName: "ball5")]
    
    @IBAction func askButtonTapped(_ sender: UIButton) {
        magicBallImageView.image = ballsArray.randomElement()
    }
}

