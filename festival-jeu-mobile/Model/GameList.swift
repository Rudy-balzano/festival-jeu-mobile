//
//  GameListModel.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation

class GameList: ObservableObject {
    
    private(set) var games = [Game]()
    
    func new(games: [Game]){
        self.games = games
    }
}
