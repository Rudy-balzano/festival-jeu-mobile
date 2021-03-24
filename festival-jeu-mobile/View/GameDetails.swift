//
//  GameDetails.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import SwiftUI

struct GameDetails: View {
    
    var game: Game
    
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

struct GameDetails_Previews: PreviewProvider {
    static var previews: some View {
        let a = "a"
        let company = Company(id:1, name:a)
        let area = Area(id: 1, label: a)
        
        GameDetails(game: Game(id:1,name: a, notice: a, duration: a, minPlayers: 1, maxPlayers: 1, minAge: 1, maxAge: 1, isPrototype: true, publisher: company, gameType: a, area: area))
    }
}
