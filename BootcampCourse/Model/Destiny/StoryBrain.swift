//
//  StoryBrain.swift
//  BootcampCourse
//
//  Created by yauheni prakapenka on 22.12.2019.
//  Copyright © 2019 yauheni prakapenka. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories = [Story(title: "You see a fork in the road", choice1: "Take a left", choice2: "Take a right"),
                   Story(title: "You see a tiger", choice1: "Shout for help", choice2: "Play dead"),
                   Story(title: "You find a treasure chest", choice1: "Open it", choice2: "Check for traps")
    ]
    
    var storyNumber = 0
    
    func getStoryTitle() -> String {
        return stories[storyNumber].title
    }
    
    func getChoiceOneButtonTitle() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoiceTwoButtonTitle() -> String {
        return stories[storyNumber].choice2
    }
    
    mutating func nextStory(userChoice: String) {
        if storyNumber < stories.count {
            switch userChoice {
            case "Take a left":
                self.storyNumber = 1
            case "Take a right":
                self.storyNumber = 2
            default:
                self.storyNumber = 0
            }
        }
    }
}
