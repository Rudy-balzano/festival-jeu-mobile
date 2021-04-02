//
//  GameDetails.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import SwiftUI

struct GameDetailsView: View {
    @Environment(\.presentationMode) var presentation

    
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
                Image(systemName: "doc.richtext")
                Text("Nom du jeu:")
                Text(jeu.name)
                Spacer()
            }
            
            HStack{
                Image(systemName: "clock")
                Text("Durée du jeu:")
                Text(jeu.duration)
                Spacer()}

            HStack{
                Image(systemName: "smiley")
                Text("Nombres de joueurs:")
                Text("\(jeu.minPlayers)"+"-"+"\(jeu.maxPlayers)")
                Spacer()}
            HStack{
                Image(systemName: "lessthan.square")
                Text("Age minimum:")
                Text("\(jeu.minAge)")
                Spacer()}

            HStack{
                Image(systemName: "greaterthan.square")
                Text("Age maximum:")
                Text("\(jeu.maxAge)")
                Spacer()}
            
            
            HStack{
                Image(systemName: "pencil")
                Text("Editeur du jeu:")
                Text(jeu.publisher)
                Spacer()}
            HStack{
                Image(systemName: "star")
                Text("Type de jeu:")
                
                Text(jeu.gameType)
                Spacer()}
            HStack{
                Image(systemName: "location")
                Text("Zone du jeu:")
                Text(jeu.area)
                Spacer()}

                
        }.padding(.bottom, geometry.size.height * 0.02 )
        }
        }.navigationTitle(jeu.name)

}

}
