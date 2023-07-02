//
//  PostRecomendationViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/07/23.
//

import Foundation


class PostRecomendationViewController: UIViewController {
    @IBOutlet weak var puntajeLabel: UILabel!
    var museumTexto: String = ""
    var allQuestions: [Question]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        puntajeLabel.text = SessionData.shared.nombreMuseo ?? ""
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "preReco2", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSend" {
            let destinationVC = segue.destination as? ViewController
            destinationVC?.allQuestions = allQuestions
        }
    }
    

    
}
