//
//  GameListViewIntent.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 31/03/2021.
//

import Foundation
import SwiftUI

class GameListViewIntent{
    
    @ObservedObject var gameList : GameListViewModel
    
    init(gameList : GameListViewModel){
        self.gameList = gameList
    }
    
    func loaded(games: [Game]){
        self.gameList.gameListState = .ready
    }
    
    func httpJsonLoaded(result : Result<[Game],HttpRequestError>){
        print("aaaa")
        switch result {
        case let .success(data):
            print(data)
            if let name = nameFilter{
                print("a")
                let games = data.filter({game in game.name.lowercased().contains(name.lowercased())})
                gameList.gameListState = .loaded(games)
            }
            else {
                gameList.gameListState = .loaded(data)
            }
        case let .failure(error):
            gameList.gameListState = .loadingError(error)
        }
    }
    
    func gameLoaded(){
        gameList.gameListState = .ready
    }
    
    var nameFilter: String? = nil
    
    func loadGameList(url: String, nameFilter: String?){
        self.nameFilter = nameFilter
        gameList.gameListState = .loading(url)
        LoadHelper.loadGamesFromAPI(url: url, endofrequest: httpJsonLoaded)
        //print(gameList.games.count)
    }
}
