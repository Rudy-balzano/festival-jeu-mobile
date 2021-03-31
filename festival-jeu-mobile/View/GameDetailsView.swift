//
//  GameDetails.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import SwiftUI

struct GameDetailsView: View {
    
    var game: Game
    
    init(game : Game){
        self.game = game
    }
    
    var body: some View {
        VStack{
            HStack{
                Text(game.name)
                Spacer()
            }
            HStack{
                Text(game.notice)
            }
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
