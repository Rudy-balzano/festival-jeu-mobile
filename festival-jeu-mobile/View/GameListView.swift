//
//  MainView.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import SwiftUI

struct GameListView: View {
    
//    let games = [
//        Game(id:1,name: "a", notice: "a", duration: "a", minPlayers: 1, maxPlayers: 1, minAge: 1, maxAge: 1, isPrototype: true, publisher: Company(id:1, name:"a"), gameType: "a", area: Area(id: 1, label: "a"))
//        ]
    
    @ObservedObject var gameList : GameListViewModel
    
    init(gameList: GameListViewModel){
        self.gameList = gameList
    }
    
    var games : [GameViewModel]{
        return self.gameList.games
    }
    
    var body: some View {
        
        return NavigationView{
            VStack{
                List{
                    ForEach(games){ game in
                        Text(game.name)
                    }
                }
                .navigationTitle("Liste des jeux")
            }
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    
    static var previews: some View {
        GameListView(gameList: GameListViewModel(GameList()))
        
    }
}
