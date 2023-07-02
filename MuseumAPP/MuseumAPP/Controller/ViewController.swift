//
//  ViewController.swift
//  MuseumAPP
//
//  Created by pnoronha on 24/10/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    var answerArray = Array<String?>()
    var i = 0
    var scoreText: String = ""
    var museumTexto: String = ""
    
    //Outlet for Buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBOutlet weak var SenderButton: UIButton!
    
    var allQuestions: [Question]?
    var questionNumber: Int = 0
    var score: Double = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        var titleButton = sender.titleLabel?.text
        if questionNumber == allQuestions?.count {
            if sender.tag == 1 {
                score = score + 2.5
            }
            if sender.tag == 2 {
                score = score + 5
            }
            if sender.tag == 3 {
                score = score + 7.5
            }
            if sender.tag == 4 {
                score = score + 10
            }
            answerArray.insert(titleButton, at: i)
            sendDataToLambda()
            self.SenderButton.isHidden = false
            print(self.answerArray)
           
        }else{
            answerArray.insert(titleButton, at: i)
            i = i + 1
            if sender.tag == 1 {
                score = score + 2.5
            }
            if sender.tag == 2 {
                score = score + 5
            }
            if sender.tag == 3 {
                score = score + 7.5
            }
            if sender.tag == 4 {
                score = score + 10
            }
            
        }
        questionNumber += 1
        updateQuestion()
    }
    
    @IBAction func hacerSeguebutton(_ sender: UIButton)  {
        self.hacersegue()
    }
    
    func updateQuestion(){
        //revisar tema de subida de numeros
        if questionNumber < allQuestions?.count ?? 0{
            questionLabel.text = allQuestions?[questionNumber].questionText
            optionA.setTitle(allQuestions?[questionNumber].choiceA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions?[questionNumber].choiceB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions?[questionNumber].choiceC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions?[questionNumber].choiceD, for: UIControl.State.normal)
        }else {
        }
        
    }
    func restartQuiz(){
        questionNumber = 0
        updateQuestion()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRecomendation" {
            let destinationVC = segue.destination as? RecomendationViewController
            destinationVC?.allAnswwer = answerArray
            destinationVC?.score = scoreText
            destinationVC?.museum = museumTexto
        }
    }
    
    
    func sendDataToLambda() {
        let url = URL(string: "https://979u1pil6h.execute-api.us-east-1.amazonaws.com/Developer/personalize")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = [
            "userId": String(score)
        ] as [String : Any]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                       let jsonDict = jsonObject as? [String: Any],
                       let recommendedItems = jsonDict["recommended_items"] as? [String],
                       let firstItem = recommendedItems.first {
                        self.scoreText = firstItem
                        self.obtenerMuseo(firstItem)
                        print("First recommended item: \(self.scoreText)")
                    } else {
                        print("Invalid JSON response")
                    }
                }
            }
            task.resume()
        } catch {
            print("Error encoding JSON: \(error)")
        }
    }
    
    func obtenerMuseo(_ museum: String) {
        
        switch museum{
        case "228":
            self.museumTexto = "Lugar de la Memoria, la Tolerancia y la Inclusión Social"
        case "40":
            self.museumTexto = "Museo de Arte Italiano"
        case "42":
            self.museumTexto = "Museo de la Nación"
        case "36":
            self.museumTexto = "Museo de Sitio Arturo Jimenez Borja - Puruchuco"
        case "39":
            self.museumTexto = "Museo de Sitio Mirador del Cerro San Cristobal"
        case "37":
            self.museumTexto = "Museo de Sitio Huallamarca"
        case "38":
            self.museumTexto = "Museo de Sitio Pachacamac"
        case "41":
            self.museumTexto = "Museo de Sitio Pucllana"
        case "43":
            self.museumTexto = "Museo Jose Carlo Mariategui"
        case "44":
            self.museumTexto = "Museo Nacional de Arqueologia, Antropologia e Historia del Perú"
        case "45":
            self.museumTexto = "Museo Nacional de la Cultura Peruana"
        case "29":
            self.museumTexto = "Museo Nacional del Perú"
        default:
            self.museumTexto = "Museo desconocido"
        }
    }
    
    func hacersegue() {
        performSegue(withIdentifier: "goToRecomendation", sender: self)
    }
    
}
