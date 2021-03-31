//
//  festival_jeu_mobileApp.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 23/03/2021.
//

import SwiftUI

@main
struct festival_jeu_mobileApp: App {
    
    static var filename = "test.json"
    static var fileUrl : URL!
    static var games = [Game]()
    static var gameList = GameList()
    
    //Gestion des erreurs a faire
    //forResource: festival_jeu_mobileApp.filename, withExtension: nil
    
    init(){
//        guard let url = Bundle.main.url(forResource: festival_jeu_mobileApp.filename, withExtension: nil) else {
//            fatalError("playlist file missing")
//            }
//
//        Self.fileUrl = URL(string: "localhost:3000/festival/current/reserved-games")
//
//        do {
//            try Self.games = LoadHelper.loadGames(fromFile: Self.filename).get()
//        } catch {
//           print("error")
//    }
//
//        let result = LoadHelper.loadGames(fromFileUrl: Self.fileUrl)
//
//        switch result {
//        case .success(let g):
//            Self.games = g
//        case .failure:
//            print("error")
//        }
//
//        Self.gameList.new(games: Self.games)
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
            
        }
    }

