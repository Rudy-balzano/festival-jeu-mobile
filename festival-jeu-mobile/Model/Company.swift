//
//  Company.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class Company {
    
    private(set) var id : Int
    
    private(set) var name : String
    
    private(set) var games: [Game]
    
    init(id : Int, name : String) {
        
        self.id = id
        self.name = name
        self.games = []
    }
    
    func getCompanyGames(listGames:[Game]){
        for i in listGames{
            if i.publisher.name == self.name {
                self.games.append(i)
            }
        }
    }
}
