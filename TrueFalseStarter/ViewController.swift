//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {

    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var triviaQuestions = Questions()
    
    var gameSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // the function randomly selects a questions for the triviaQuetions object and checks to see if it has already been asked, if "true", the loop repeats and selects a different questions. Once a questions is selected tnat has not been asked, the question is displayed along with matching answers
    func displayQuestion() {
        var questionDictionary: [String: String] = [:]
        var continuePlaying: Bool = true
        while continuePlaying {
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: triviaQuestions.trivia.count)
            if triviaQuestions.trivia[indexOfSelectedQuestion]["alreadyAsked"] == "false" {
                questionDictionary = triviaQuestions.trivia[indexOfSelectedQuestion]
                triviaQuestions.trivia[indexOfSelectedQuestion]["alreadyAsked"] = "true"
                continuePlaying = false
            }
        }
        questionField.text = questionDictionary["Question"]
        option1Button.setTitle(questionDictionary["option1"], for: UIControlState.normal)
        option2Button.setTitle(questionDictionary["option2"], for: UIControlState.normal)
        option3Button.setTitle(questionDictionary["option3"], for: UIControlState.normal)
        option4Button.setTitle(questionDictionary["option4"], for: UIControlState.normal)
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = triviaQuestions.trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender === option1Button &&  correctAnswer == option1Button.titleLabel?.text) || (sender === option2Button && correctAnswer == option1Button.titleLabel?.text) || (sender === option3Button &&  correctAnswer == option3Button.titleLabel?.text) || (sender === option4Button && correctAnswer == option4Button.titleLabel?.text) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

