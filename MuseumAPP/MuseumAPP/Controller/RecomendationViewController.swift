//
//  RecomendationViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 13/04/23.
//

import UIKit

class RecomendationViewController: UIViewController {

    @IBOutlet weak var museumLabel: UILabel!
    var allAnswwer: [String?] = []
    var score: String = ""
    var museum: String = ""

    
    override func viewDidLoad() {
        self.museumLabel.text = museum
        
        SessionData.shared.eventType = "visitas"
        SessionData.shared.eventValue = 1
        SessionData.shared.timestamp = "2023"
        SessionData.shared.userID = score
        SessionData.shared.itemID = museum
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {

        if sender.titleLabel?.text == "Comparte tus resultados" {
            alertas(museum)
          
        } else if  sender.titleLabel?.text == "Envianos tus comentarios" {
            performSegue(withIdentifier: "goToSend", sender: self)
        }
    
    }
    
    func alertas(_ museum: String){
        let alert = UIAlertController(title: "Compartido", message: "La recomendacion del \(museum)" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSend" {
            let destinationVC = segue.destination as? SendInfoViewController
            destinationVC?.museumSend = museum
        }
    }

}
