//
//  SendInfoViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 14/06/23.
//

import UIKit

class SendInfoViewController: UIViewController {

    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var museumTextField: UITextField!
    var museumSend: String = ""


    override func viewDidLoad() {
        SessionData.shared.asertado = switchControl.isOn
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sendDataToLambda()
        let alert = UIAlertController(title: "Gracias", message: "Tus Informacion sera usada para mejorar nuestro servicio", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            SessionData.shared.asertado = true
        } else {
            SessionData.shared.asertado = false
        }
    }
    
    func sendDataToLambda() {
        let url = URL(string: "https://979u1pil6h.execute-api.us-east-1.amazonaws.com/Developer/museum")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = [
            "USER_ID": SessionData.shared.userID ?? "",
            "ITEM_ID": SessionData.shared.itemID ?? "",
            "EVENT_TYPE": SessionData.shared.eventType ?? "",
            "EVENT_VALUE": SessionData.shared.eventValue ?? "",
            "TIMESTAMP": SessionData.shared.timestamp ?? 0,
            "CORREO": SessionData.shared.correo ?? "",
            "ASERTADO": SessionData.shared.asertado ?? false,
            "MUSEO": museumSend
        ] as [String : Any]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("Response: \(responseString ?? "")")
                }
            }
            task.resume()
        } catch {
            print("Error encoding JSON: \(error)")
        }
    }

}
