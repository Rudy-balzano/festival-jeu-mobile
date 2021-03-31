//
//  Game.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import Foundation

class Game : Identifiable, ObservableObject {
    
    private(set) var id : Int
    
    private(set) var name : String
    
    private(set) var notice : String
    
    private(set) var duration: String
    
    private(set) var minPlayers : Int
    
    private(set) var maxPlayers : Int
    
    private(set) var minAge : Int
    
    private(set) var maxAge : Int
    
    private(set) var isPrototype : Bool
    
    private(set) var publisher : String
    
    private(set) var gameType : String
    
    private(set) var area : String
    
    init(id : Int,name:String, notice:String, duration:String, minPlayers:Int, maxPlayers:Int, minAge:Int, maxAge:Int, isPrototype:Bool, publisher:String,gameType:String, area:String) {
        
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
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case duration = "duration"
        case notice = "notice"
        case minPlayers = "minPlayers"
        case maxPlayers = "maxPlayers"
        case minAge = "minAge"
        case maxAge = "maxAge"
        case isPrototype = "isPrototype"
        case publisher = "publisherName"
        case gameType = "gameType"
        case area = "areaName"
    }
}
