//
//  QuizzierViewController.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 21.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import UIKit

class QuizzierViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var truebutton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        makeTrueButton()
        makeFalseButton()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if quizBrain.checkAnswer(userAnswer: sender.currentTitle!) {
            sender.backgroundColor = .green
            print("Right!")
        } else {
            sender.backgroundColor = .red
            print("Wrong")
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc private func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        progressView.setProgress(quizBrain.getProgress(), animated: true)
        scoreLabel.text = "Scores: \(quizBrain.getScore())"
        truebutton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
    private func makeTrueButton() {
        truebutton.layer.borderWidth = 4
        truebutton.layer.borderColor = #colorLiteral(red: 0.2472991943, green: 0.3869664967, blue: 0.5797886252, alpha: 1)
        truebutton.layer.cornerRadius = 20
    }
    
    private func makeFalseButton() {
        falseButton.layer.borderWidth = 4
        falseButton.layer.borderColor = #colorLiteral(red: 0.2472991943, green: 0.3869664967, blue: 0.5797886252, alpha: 1)
        falseButton.layer.cornerRadius = 20
    }
}
