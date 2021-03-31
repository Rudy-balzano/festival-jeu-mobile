//
//  GameViewModel.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation
import SwiftUI

class GameViewModel: Identifiable {
    
    @ObservedObject private(set) var model : Game
    
    var id : Int{
        return model.id
    }
    
    var name : String{
        return model.name
    }
    
    var notice : String{
        return model.notice
    }
    
    var duration : String{
        return model.duration
    }
    
    var maxPlayers : Int{
        return model.maxPlayers
    }
    
    var minPlayers : Int{
        return model.minPlayers
    }
    
    var maxAge : Int{
        return model.maxAge
    }
    
    var minAge : Int{
        return model.minAge
    }
    
    var isPrototype : Bool{
        return model.isPrototype
    }
    
    var publisher : String{
        return model.publisher
    }
    
    var gameType : String{
        return model.gameType
    }
    
    var area : String{
        return model.area
    }
    
    
    init(_ game : Game){
        self.model = game
    }
}
