//
//  GameType.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class GameType {
    
    private(set) var id : Int
    
    private(set) var label : String
    
    init(id:Int, label:String){
        
        self.id = id
        self.label = label
    }
}
