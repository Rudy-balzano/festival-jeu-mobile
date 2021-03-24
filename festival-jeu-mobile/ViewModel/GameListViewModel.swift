//
//  GameListViewModel.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation

class GameListViewModel: ObservableObject{
    
    private(set) var model : GameList
    
    @Published private(set) var games = [GameViewModel]()
    
    init(_ gameList: GameList){
        self.model = gameList
    }
    
    func initwith(games : [Game]){
        self.model.new(games:games)
    }
}
