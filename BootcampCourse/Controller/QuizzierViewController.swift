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
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var bottonThree: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        bottomOne()
        buttomTwo()
        bottomThree()
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
        
        buttonOne.setTitle(quizBrain.setName(button: "One") , for: .normal)
        buttonTwo.setTitle(quizBrain.setName(button: "Two"), for: .normal)
        bottonThree.setTitle(quizBrain.setName(button: "Three"), for: .normal)
        buttonOne.backgroundColor = .clear
        buttonTwo.backgroundColor = .clear
        bottonThree.backgroundColor = .clear
    }
    
    private func bottomOne() {
        buttonOne.layer.borderWidth = 4
        buttonOne.layer.borderColor = #colorLiteral(red: 0.2472991943, green: 0.3869664967, blue: 0.5797886252, alpha: 1)
        buttonOne.layer.cornerRadius = 20
    }
    
    private func buttomTwo() {
        buttonTwo.layer.borderWidth = 4
        buttonTwo.layer.borderColor = #colorLiteral(red: 0.2472991943, green: 0.3869664967, blue: 0.5797886252, alpha: 1)
        buttonTwo.layer.cornerRadius = 20
    }
    
    private func bottomThree() {
        bottonThree.layer.borderWidth = 4
        bottonThree.layer.borderColor = #colorLiteral(red: 0.2472991943, green: 0.3869664967, blue: 0.5797886252, alpha: 1)
        bottonThree.layer.cornerRadius = 20
    }
}
