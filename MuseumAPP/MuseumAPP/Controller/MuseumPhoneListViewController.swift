//
//  MuseumPhoneListViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/06/23.
//

import UIKit

class MuseumPhoneListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let museums = [
        Museum(name: "Lugar de la Memoria, la Tolerancia y la Inclusión Social", phone: "(01) 7192065"),
        Museum(name: "Museo de Arte Italiano", phone: "(01) 3215622"),
        Museum(name: "Museo de la Nación", phone: "(01) 6189393"),
        Museum(name: "Museo de Sitio Arturo Jiménez Borja - Puruchuco", phone: "(01) 3215623"),
        Museum(name: "Museo de Sitio Mirador del Cerro San Cristóbal", phone: "(01) 3215625"),
        Museum(name: "Museo de Sitio Huallamarca", phone: "(01) 2224124"),
        Museum(name: "Museo de Sitio Pachacamac", phone: " (01) 3215606"),
        Museum(name: "Museo de Sitio Pucllana", phone: "(01) 6177148"),
        Museum(name: "Museo José Carlos Mariátegui", phone: "(01) 3215620"),
        Museum(name: "Museo Nacional de Arqueología, Antropología e Historia del Perú", phone: "(01) 3215630"),
        Museum(name: "Museo Nacional de la Cultura Peruana", phone: "(01) 3215626"),
        Museum(name: "Museo Nacional del Perú", phone: "No tiene")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func simulateCallToPhoneNumber(_ phoneNumber: String) {
        let alert = UIAlertController(title: "Llamada", message: "Llamando \(phoneNumber)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension MuseumPhoneListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuseumPhoneCell", for: indexPath)
        let museum = museums[indexPath.row]
        cell.textLabel?.text = museum.name
        cell.detailTextLabel?.text = museum.phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let museum = museums[indexPath.row]
           simulateCallToPhoneNumber(museum.phone)
        }
}

struct Museum {
    let name: String
    let phone: String
}

