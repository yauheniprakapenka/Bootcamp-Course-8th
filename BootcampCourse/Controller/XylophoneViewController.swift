//
//  XylophoneViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 18.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit
import AVFoundation

class XylophoneViewController: UIViewController {
    
    private var player = AVAudioPlayer()
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        playSound(title: sender.currentTitle!)
        sender.alpha = 0.5
        UIView.animate(withDuration: 0.2) {
            sender.alpha = 1
        }
    }
    
    private func playSound(title: String) {
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
