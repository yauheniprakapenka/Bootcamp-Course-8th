//
//  TipsyResultViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 23.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class TipsyResultViewController: UIViewController {
    
    @IBOutlet weak var totalBillforOnePersonLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var totalBillForOnePerson = ""
    var percent = 0
    var numberOfPerson = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalBillforOnePersonLabel.text = totalBillForOnePerson
        settingLabel.text = "Split between \(numberOfPerson) people, with \(percent)% tip"
    }
    
    @IBAction func recalculateButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
