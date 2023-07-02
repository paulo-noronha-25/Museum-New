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
    //Outlet for Buttons
    @IBOutlet weak var quizButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var ReservationButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        postRequest(email: SessionData.shared.correo ?? "")
    }

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
        if sender.titleLabel?.text == "Cuestionario" {
            var i = 0
            for easyQuestion in questions ?? [] where questions?[i].museum == "a" {
                questionArray.insert(easyQuestion, at: i)
                i = i + 1
            }
            if SessionData.shared.nombreMuseo == nil {
                performSegue(withIdentifier: "goToQuiz", sender: self)
            } else {
                performSegue(withIdentifier: "preReco1", sender: self)
            }
        } else if  sender.titleLabel?.text == "Info Museos" {
            performSegue(withIdentifier: "goToInfo", sender: self)
        } else if  sender.titleLabel?.text == "Opiniones" {
            performSegue(withIdentifier: "goToReservation", sender: self)
        } else if  sender.titleLabel?.text == "Chat" {
            performSegue(withIdentifier: "goToHelp", sender: self)
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuiz" {
            let destinationVC = segue.destination as? ViewController
            destinationVC?.allQuestions = questionArray
        }
        if segue.identifier == "goToInfo" {
            
        }
        if segue.identifier == "goToReservation" {
           
        }
        if segue.identifier == "goToHelp" {
           
        }
        if segue.identifier == "preReco1" {
            let destinationVC = segue.destination as? PostRecomendationViewController
            destinationVC?.allQuestions = questionArray
        }
    }
    
    func postRequest(email: String) {
        guard let url = URL(string: "https://979u1pil6h.execute-api.us-east-1.amazonaws.com/Developer/reuso") else {
            print("Invalid URL")
            return
        }
        
        let requestData = ["email": email]
        let jsonData = try? JSONSerialization.data(withJSONObject: requestData, options: [])
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data {
                do {
                    let responseJson = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let fileName = responseJson?["file_name"] as? String
                    SessionData.shared.nombreMuseo = fileName
                    
                    print("File Name: \(fileName ?? "Unknown")")
                    
                    // Aquí puedes realizar las acciones que necesites con el nombre del archivo
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                  
                }
            }
        }
        
        task.resume()
    }


}
