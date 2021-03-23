//
//  Game.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class Game {
    
    private(set) var id : Int
    
    private(set) var name : String
    
    private(set) var notice : String
    
    private(set) var duration: String
    
    private(set) var minPlayers : Int
    
    private(set) var maxPlayers : Int
    
    private(set) var minAge : Int
    
    private(set) var maxAge : Int
    
    private(set) var isPrototype : Bool
    
    private(set) var publisher : Company
    
    private(set) var gameType : GameType
    
    private(set) var area : Area
    
    init(id:Int, name:String, notice:String, duration:String, minPlayers:Int, maxPlayers:Int, minAge:Int, maxAge:Int, isPrototype:Bool, publisher:Company,gameType:GameType, area:Area) {
        
        self.id = id
        self.name = name
        self.duration = duration
        self.notice = notice
        self.minPlayers = minPlayers
        self.maxPlayers = maxPlayers
        self.minAge = minAge
        self.maxAge = maxAge
        self.isPrototype = isPrototype
        self.publisher = publisher
        self.gameType = gameType
        self.area = area
        <#statements#>
    }
}
