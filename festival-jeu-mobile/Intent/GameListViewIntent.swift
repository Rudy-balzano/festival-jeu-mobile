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
    
    func httpJsonLoaded(result : Result<[GameData],HttpRequestError>){
        switch result {
        case let .success(data):
            let games = LoadHelper.gameData2Game(data: data)
            gameList.gameListState = .loaded(games)
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
        LoadHelper.loadFromAPI(url: url, endofrequest: httpJsonLoaded)
    }
}
