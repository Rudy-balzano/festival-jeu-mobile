//
//  GameListViewModel.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation
import SwiftUI
import Combine

enum GameListState: CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Game])
    case loadingError(Error)
    case newGames([GameViewModel])
    
    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "Loading \(s)"
        case .loaded(let games) : return "Loaded \(games.count) games"
        case .loadingError(let error) : return "Loading error : Error Loading -> \(error)"
        case .newGames(let games) : return "New games : reset game with \(games.count) games"
        }
    }
}

class GameListViewModel: ObservableObject, GameListDelegate{
    
    private(set) var model : GameList
    
    @Published private(set) var games = [GameViewModel]()
    
    @Published var formViewOpen = false
    
    @Published var gameListState : GameListState = .ready{
        didSet{
            switch self.gameListState {
            case let .loaded(data):
                self.formViewOpen = false
                self.model.new(games: data)
            case .loadingError:
                self.formViewOpen = true
            default:
                return
            }
        }
    }
    
    init(_ gameList: GameList){
        self.model = gameList
        self.model.delegate = self
    }
    
    func new(games: [Game]){
        self.model.new(games: games)
    }
    
    func removeAllGames(){
        self.model.removeAllGames()
    }
    
    func gameListDeleted() {
        self.games.removeAll()
    }
    
    func newGameList() {
        self.games.removeAll()
        for game in self.model.games{
            self.games.append(GameViewModel(game))
        }
        self.gameListState = .newGames(self.games)
    }
}
