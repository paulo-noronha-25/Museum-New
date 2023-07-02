//
//  SesionData.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 15/06/23.
//

class SessionData {
    static let shared = SessionData()
    
    var userID: String?
    var itemID: String?
    var eventType: String?
    var eventValue: Int?
    var timestamp: String?
    var correo: String?
    var asertado: Bool?
    var nombreMuseo: String?
    
    private init() {}
}
