//
//  ViewController.swift
//  Quizz_App
//
//  Created by Fadi Salah on 29/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice1: UIButton!
    
   var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UpdateUI()

    }

    @IBAction func answerButtonBressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer( userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
      
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector( UpdateUI), userInfo: nil, repeats: false)

     

        
    }
    @objc func UpdateUI (){
        questionLabel.text = quizBrain.getQuestionText()
        
        
        let answerChoices = quizBrain.getAnswers()
        
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

        
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }
    
}

