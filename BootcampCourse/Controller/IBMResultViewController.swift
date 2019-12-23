//
//  IBMResultViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class IBMResultViewController: UIViewController {
    
    var bmiValue = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = bmiValue
        label.textColor = .white
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        view.addSubview(label)
    }
}
