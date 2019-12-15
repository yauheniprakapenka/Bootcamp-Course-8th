//
//  DicesViewController.swift
//  TheCompleteIOSAppDevelopmentBootcampCourse
//
//  Created by yauheni prakapenka on 15.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class DicesViewController: UIViewController {
    
    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    let dicesArray = [#imageLiteral(resourceName: "dice1"), #imageLiteral(resourceName: "dice2"), #imageLiteral(resourceName: "dice3"), #imageLiteral(resourceName: "dice4"), #imageLiteral(resourceName: "dice5"), #imageLiteral(resourceName: "dice6")]
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        leftDiceImageView.image = dicesArray[Int.random(in: 0...5)]
        rightDiceImageView.image = dicesArray[Int.random(in: 0...5)]
    }
}
