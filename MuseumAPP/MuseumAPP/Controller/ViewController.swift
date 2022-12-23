//
//  ViewController.swift
//  MuseumAPP
//
//  Created by pnoronha on 24/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var flagView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    var allQuestions: [Question]?
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            ProgressHUD.showSuccess("Correct")
            score += 50
            
        }else{
            ProgressHUD.showError("Incorrect")
            
            
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    
    func updateQuestion(){
        //revisar tema de subida de numeros
        if questionNumber < allQuestions?.count ?? 0{
            flagView.image = UIImage(named:(allQuestions?[questionNumber].image ?? ""))
            questionLabel.text = allQuestions?[questionNumber].questionText
            optionA.setTitle(allQuestions?[questionNumber].choiceA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions?[questionNumber].choiceB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions?[questionNumber].choiceC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions?[questionNumber].choiceD, for: UIControl.State.normal)
           selectedAnswer = allQuestions?[questionNumber].answer ?? 1
            updateUI()
            
        }else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    func updateUI(){
        scoreLabel.text = "Score: \(score)"
        questionCounter.text = "\(questionNumber)"
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        updateQuestion()
        
    }
    


}


