//
//  Questions.swift
//  TrueFalseStarter
//
//  Created by Peter Evans on 5/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

// a simple struct containing a dictionary of questions and cooresponding answers. I also added "alreadyAsked" key and holds whether or not the question has already been asked. 

struct Questions {

    var trivia: [[String : String]] = [
        ["Question": "This was the only US President to serve more than two consecutive terms.", "option1": "George Washington", "option2": "Franklin D. Roosevelt", "option3": "Woodrow Wilson", "option4": "Andrew Jackson", "Answer": "Franklin D. Roosevelt", "alreadyAsked": "false"],
        ["Question": "Which of the following countries has the most residents?", "option1": "Nigeria", "option2": "Russia", "option3": "Iran", "option4": "Vietnam", "Answer": "Nigeria", "alreadyAsked": "false"],
        ["Question": "In what year was the United Nations founded?", "option1": "1918", "option2": "1919", "option3": "1945", "option4": "1954", "Answer": "1945", "alreadyAsked": "false"],
        ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?", "option1": "Paris", "option2": "Washington D.C.", "option3": "New York City", "option4": "Boston", "Answer": "New York City", "alreadyAsked": "false"],
        ["Question": "Which nation produces the most oil?", "option1": "Iran", "option2": "Iraq", "option3": "Brazil", "option4": "Canada", "Answer": "Canada", "alreadyAsked": "false"],
        ["Question": "Which country has most recently won consecutive World Cups in Soccer?", "option1": "Italy", "option2": "Brazil", "option3": "Argetina", "option4": "Spain", "Answer": "Brazil", "alreadyAsked": "false"],
        ["Question": "Which of the following rivers is longest?", "option1": "Yangtze", "option2": "Mississippi", "option3": "Congo", "option4": "Mekong", "Answer": "Mississippi", "alreadyAsked": "false"],
        ["Question": "Which city is the oldest?", "option1": "Mexico City", "option2": "Cape Town", "option3": "San Juan", "option4": "Sydney", "Answer": "Mexico City", "alreadyAsked": "false"],
        ["Question": "Which country was the first to allow women to vote in national elections?", "option1": "Poland", "option2": "United States", "option3": "Sweden", "option4": "Senegal", "Answer": "Poland", "alreadyAsked": "false"],
        ["Question": "Which of these countries won the most medals in the 2012 Summer Games?", "option1": "France", "option2": "Germany", "option3": "Japan", "option4": "Great Britian", "Answer": "Great Britian", "alreadyAsked": "false"]
    ]

    
}
