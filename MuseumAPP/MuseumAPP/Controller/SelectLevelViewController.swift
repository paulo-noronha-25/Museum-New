//
//  SelectLevelViewController.swift
//  MuseumAPP
//
//  Created by pnoronha on 7/11/22.
//

import UIKit

class SelectLevelViewController: UIViewController {
    private var questions: [Question]?
    private var questionArray = Array<Question>()
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    //Outlet for Buttons
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumoButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!

    override func viewDidLoad() {
      super.viewDidLoad()
      QuestionManager().fetchFilms { (Question) in
        self.questions = Question
          print(self.questions ?? "")
        DispatchQueue.main.async{
        }
      }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Facil" {
            var i = 0
            for easyQuestion in questions ?? [] where questions?[i].dificulty == "easy" {
                questionArray.insert(easyQuestion, at: i)
                i = i + 1
            }
          
        } else if  sender.titleLabel?.text == "Medio" {
            var i = 0
            for easyQuestion in questions ?? [] where questions?[i].dificulty == "medium" {
                questionArray.insert(easyQuestion, at: i)
                i = i + 1
            }
        } else if  sender.titleLabel?.text == "Dificil" {
            var i = 0
            for easyQuestion in questions ?? [] where questions?[i].dificulty == "hard" {
                questionArray.insert(easyQuestion, at: i)
                i = i + 1
            }
        }
        performSegue(withIdentifier: "goToQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuiz" {
            let destinationVC = segue.destination as? ViewController
            destinationVC?.allQuestions = questionArray
        }
    }
}
