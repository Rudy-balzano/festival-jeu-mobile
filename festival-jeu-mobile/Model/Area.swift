//
//  Area.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class Area {
    private(set) var id : Int
    
    private(set) var label : String
    
    private(set) var games : [Game]
    
    init(id : Int, label : String) {
        
        self.id = id
        self.label = label
        self.games = []
    }
    
//    func getAreaGames(listGames:[Game]){
//        for i in listGames{
//            if i.area.label == self.label {
//                self.games.append(i)
//            }
//        }
//    }
}
