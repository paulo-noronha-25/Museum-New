//
//  MuseumListViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/06/23.
//

import UIKit

class MuseumListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    
    
    let museums = [
            MuseumDef(name: "Lugar de la Memoria, la Tolerancia y la Inclusión Social", imageName: "img1", description: "Museo memorial dedicado a las víctimas de la violencia política en el Perú."),
            MuseumDef(name: "Museo de Arte Italiano", imageName: "img2", description: "Exhibición de arte y cultura italiana en el Perú."),
            MuseumDef(name: "Museo de la Nación", imageName: "img3", description: "Museo nacional que muestra la historia y el patrimonio del Perú."),
            MuseumDef(name: "Museo de Sitio Arturo Jiménez Borja - Puruchuco", imageName: "img4", description: "Museo de sitio arqueológico que exhibe el complejo precolombino de Puruchuco."),
            MuseumDef(name: "Museo de Sitio Mirador del Cerro San Cristóbal", imageName: "img5", description: "Museo de sitio ubicado en el Cerro San Cristóbal, que ofrece vistas panorámicas y exhibiciones históricas."),
            MuseumDef(name: "Museo de Sitio Huallamarca", imageName: "img6", description: "Museo de sitio en el sitio arqueológico de Huallamarca, con exhibiciones sobre la cultura peruana antigua."),
            MuseumDef(name: "Museo de Sitio Pachacamac", imageName: "img7", description: "Museo de sitio arqueológico que muestra las ruinas y artefactos de Pachacamac."),
            MuseumDef(name: "Museo de Sitio Pucllana", imageName: "img8", description: "Museo de sitio ubicado en el sitio arqueológico de Huaca Pucllana en Lima."),
            MuseumDef(name: "Museo José Carlos Mariátegui", imageName: "img9", description: "Museo dedicado a la vida y obra del escritor y pensador político peruano José Carlos Mariátegui."),
            MuseumDef(name: "Museo Nacional de Arqueología, Antropología e Historia del Perú", imageName: "img10", description: "Museo nacional enfocado en la arqueología, antropología e historia del Perú."),
            MuseumDef(name: "Museo Nacional de la Cultura Peruana", imageName: "img11", description: "Museo nacional que muestra la diversidad del patrimonio cultural peruano."),
            MuseumDef(name: "Museo Nacional del Perú", imageName: "img12", description: "Museo nacional del Perú, con exhibiciones de arte, historia y cultura.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowMuseumDetails",
           let destinationVC = segue.destination as? MuseumDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
            let selectedMuseum = museums[indexPath.row]
            destinationVC.museum = selectedMuseum
        }
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Mapa" {
            performSegue(withIdentifier: "goToMap", sender: self)
        } else if  sender.titleLabel?.text == "Reservaciones" {
            performSegue(withIdentifier: "goToPhone", sender: self)
        }
      
    }
}

extension MuseumListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return museums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MuseumListCell", for: indexPath)
        let museum = museums[indexPath.row]
        cell.textLabel?.text = museum.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowMuseumDetails", sender: self)
    }
   
}


struct MuseumDef {
    let name: String
    let imageName: String
    let description: String
}



class MuseumDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var museum: MuseumDef?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let museum = museum {
            imageView.image = UIImage(named: museum.imageName)
            nameLabel.text = museum.name
            descriptionLabel.text = museum.description
        }
    }
}

