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
    
    init(gameList : GameListViewModel){
        self.gameList = gameList
        self.intent = GameListViewIntent(gameList: gameList)
        let _ = self.gameList.$gameListState.sink(receiveValue: stateChanged)
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
                TextField("term filter", text: $textSearch)
                Spacer()
                ZStack{
                    List{
                        ForEach( self.gameList.games){ game in
                            Text(game.model.name)
                        }
                    }
                }
            }
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
