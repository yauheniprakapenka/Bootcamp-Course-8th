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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var truebutton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    private let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                        Question(q: "Google was originally called 'Backrub'.", a: "True"),
                        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    private var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        makeTrueButton()
        makeFalseButton()
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong")
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        updateUI()
    }
    
    private func updateUI() {
        questionLabel.text = quiz[questionNumber].question
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
