//
//  MainView.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var gameList : GameListViewModel
    var intent : GameListViewIntent
    
    let title : String
    
    init(){
        
        let gameList = GameListViewModel(GameList())
        
        let url: String = "https://festival-du-jeu-montpellier.herokuapp.com/festival/current/reserved-games"
        
        self.gameList = gameList
        self.intent = GameListViewIntent(gameList: gameList)
        self.title = "Liste des jeux"
        let _ = self.gameList.$gameListState.sink(receiveValue: stateChanged)
        self.intent.loadGameList(url: url, nameFilter: nil)
        
        
        
    }
    
    init(area: AreaViewModel){
        
        let url = "https://festival-du-jeu-montpellier.herokuapp.com/festival/current/reserved-games/area/\(area.id)"
        
        let gameList = GameListViewModel(GameList())
        self.gameList = gameList
        self.intent = GameListViewIntent(gameList: gameList)
        self.title = "\(area.label)"
        let _ = self.gameList.$gameListState.sink(receiveValue: stateChanged)
        self.intent.loadGameList(url: url, nameFilter: nil)
        
        
    }
    
    init(company: CompanyViewModel){
        
        let url = "https://festival-du-jeu-montpellier.herokuapp.com/festival/current/reserved-games/company/\(company.id)"
        
        let gameList = GameListViewModel(GameList())
        self.gameList = gameList
        self.intent = GameListViewIntent(gameList: gameList)
        self.title = " \(company.name)"
        let _ = self.gameList.$gameListState.sink(receiveValue: stateChanged)
        self.intent.loadGameList(url: url, nameFilter: nil)
        
        
    }
    
    private var searchState : GameListState{
        return self.gameList.gameListState
    }
    
    @State private var showModel = false
    @State var detailPresented = false
    @State var revealSearchForm = false
    @State var textSearch = ""
    
    var games : [GameViewModel]{
        return self.gameList.games
    }
    
    private func filterSearch(game: GameViewModel) -> Bool{
        var ret = true
        if !textSearch.isEmpty {
            ret = false
            ret = ret || game.name.contains(textSearch)
            
        }
        return ret
    }
    
    func stateChanged(state: GameListState){
        switch state {
        case .newGames:
            self.intent.gameLoaded()
        default:
            break
        }
    }
    
    var body: some View {
        return NavigationView{
            VStack{
                TextField("Game filter", text: $textSearch).font(.footnote)
                Spacer()
                ZStack{
                    List{
                        ForEach( self.gameList.games.filter(filterSearch)){ game in
                            NavigationLink(destination: GameDetailsView(game: gameList, gameViewed: game)){
                                Text(game.model.name)
                                
                            }
                        }
                    }
                }
            }.navigationTitle(title)
        }
    }
}

//struct GameListView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        GameListView(gameList: GameList())
//
//    }
//}
