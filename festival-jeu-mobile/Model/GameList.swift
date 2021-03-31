//
//  GameListModel.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation

protocol GameListDelegate {
    func newGameList()
    func gameListDeleted()
}

class GameList: ObservableObject {
    
    var delegate: GameListDelegate?
    
    private(set) var games : [Game]
    
    init(){
        self.games = []
    }
    
    func new(games: [Game]){
        self.games = games
        self.delegate?.newGameList()
    }
    
    func removeAllGames(){
        self.games.removeAll()
        self.delegate?.gameListDeleted()
    }
}
