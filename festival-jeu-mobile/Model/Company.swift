//
//  Company.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class Company : Identifiable, ObservableObject {
    
    private(set) var id : Int
    
    private(set) var name : String
    
    private(set) var adress: String
    

    
    init(id : Int, name : String, adress: String) {
        
        self.id = id
        self.name = name
        self.adress = adress
    }
    
    enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
    case adress = "adress"
}
}
