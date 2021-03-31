//
//  GameDetails.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import SwiftUI

struct GameDetailsView: View {
    
    //var game: Game
    @ObservedObject var gamelist : GameListViewModel
    let jeu : GameViewModel
    
    init(game : GameListViewModel, gameViewed: GameViewModel){
        self.gamelist = game
        self.jeu = gameViewed
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(jeu.name)
                Text(jeu.notice)
                Spacer()
            }
//            HStack{
//                Text(game.notice)
//            }
        }
    }
}

//struct GameDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        let a = "a"
//        let company = Company(id:1, name:a)
//        let area = Area(id: 1, label: a)
//
//        GameDetailsView(game: game)
//    }
//}
