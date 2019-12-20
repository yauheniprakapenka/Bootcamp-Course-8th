//
//  EggsViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 19.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import AVFoundation

class EggsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    private let eggCookingTime = ["Soft": 3, "Medium": 5, "Hard": 7]
    private var totalTime = 0
    private var timePassed = 0
    private var timer = Timer()
    private var player = AVAudioPlayer()
    
    @IBAction func eggButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggCookingTime[hardness]!

        progressView.setProgress(0, animated: true)
        timePassed = 0
        
        resultLabel.text = "\(hardness) is cooking..."
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if timePassed < totalTime {
            timePassed += 1
            progressView.setProgress(Float(timePassed) / Float(totalTime), animated: true)
        } else {
            timer.invalidate()
            resultLabel.text = "Eggs cooked 🍳"
            playAlarm()
        }
    }
    
    private func playAlarm() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
