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
    

    
    init(id : Int, name : String) {
        
        self.id = id
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
    case id = "id"
    case name = "name"
}
}
