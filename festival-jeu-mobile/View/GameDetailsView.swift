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
        GeometryReader{ geometry in
            VStack{
            Group{
                HStack{
                Text("Nom du jeu:")
                Text(jeu.name)
                Spacer()
            }
            HStack{
                Text("Notice du jeu:")
                Text(jeu.notice)
                Spacer()
            }
            
            HStack{
                Text("Durée du jeu:")
                Text(jeu.duration)
                Spacer()}

            HStack{
                Text("Nombres de joueurs:")
                Text("\(jeu.minPlayers)"+"-"+"\(jeu.maxPlayers)")
                Spacer()}
            HStack{
                Text("Age minimum:")
                Text("\(jeu.minAge)")
                Spacer()}

            HStack{
                Text("Age maximum:")
                Text("\(jeu.maxAge)")
                Spacer()}
            
            
            HStack{
                Text("Editeur du jeu:")
                Text(jeu.publisher)
                Spacer()}
            HStack{
                Text("Type de jeu:")
                Text(jeu.gameType)
                Spacer()}
            HStack{
                Text("Zone du jeu:")
                Text(jeu.area)
                Spacer()}

                
        }.padding(.bottom, geometry.size.height * 0.01 )
        }
        }.navigationTitle(jeu.name)

}

}
