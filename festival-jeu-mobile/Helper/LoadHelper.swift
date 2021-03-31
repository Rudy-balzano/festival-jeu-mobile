//
//  LoadHelper.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation

struct GameData : Codable {
    var id : Int
    var name : String
    var duration : String
    var notice : String
    var maxAge : Int
    var minAge : Int
    var maxPlayers : Int
    var minPlayers : Int
    var isPrototype : Bool
    var gameType : String
    var publisherName : String
    var areaName : String?
}

struct LoadHelper {
    
    static func gameData2Game(data: [GameData]) -> [Game]?{
        var games = [Game]()
        for gdata in data{
            let game : Game
            if (gdata.areaName == nil){
                game = Game(id: gdata.id, name: gdata.name, notice: gdata.notice, duration: gdata.duration, minPlayers: gdata.minPlayers, maxPlayers: gdata.maxPlayers, minAge: gdata.minAge, maxAge: gdata.maxAge, isPrototype: gdata.isPrototype, publisher: gdata.publisherName, gameType: gdata.gameType, area: "Autre")
            } else {
                let areaName: String = gdata.areaName!
                game = Game(id: gdata.id, name: gdata.name, notice: gdata.notice, duration: gdata.duration, minPlayers: gdata.minPlayers, maxPlayers: gdata.maxPlayers, minAge: gdata.minAge, maxAge: gdata.maxAge, isPrototype: gdata.isPrototype, publisher: gdata.publisherName, gameType: gdata.gameType, area: areaName)
            }
            games.append(game)
        }
    return games
    }
    
    static func loadGames(fromFile filename: String) -> Result<[Game],HttpRequestError>{
        guard let url = Bundle.main.url(forResource: festival_jeu_mobileApp.filename, withExtension: nil) else {
            return .failure(.badURL(filename))
        }
        return self.loadGames(fromFileUrl: url)
    }
    
    static func loadGames(fromFileUrl url: URL) -> Result<[Game],HttpRequestError>{
        let result = InOutHelper.loadJsonFile(from: url, dataType: [GameData].self)
        switch result{
        case let .success(data):
            guard let tracks = self.gameData2Game(data: data) else { return .failure(.JsonDecodingFailed) }
            return .success(tracks)
        case let .failure(error):
            return .failure(error)
        }
    }
    
    static func loadGamesFromAPI(url surl: String, endofrequest: @escaping (Result<[Game],HttpRequestError>) -> Void){
            guard let url = URL(string: surl) else {
                endofrequest(.failure(.badURL(surl)))
                return
            }
            self.loadGamesFromAPI(url: url, endofrequest: endofrequest)
        }
        static func loadGamesFromAPI(url: URL, endofrequest: @escaping (Result<[Game],HttpRequestError>) -> Void){
            self.loadGamesFromJsonData(url: url, endofrequest: endofrequest)
        }

        private static func loadGamesFromJsonData(url: URL, endofrequest: @escaping (Result<[Game],HttpRequestError>) -> Void){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decodedData : Decodable?
                        decodedData = try? JSONDecoder().decode([GameData].self, from: data)
                    guard let decodedResponse = decodedData else {
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    let gamesData : [GameData] = (decodedResponse as! [GameData])
                    guard let games = self.gameData2Game(data: gamesData)else{
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    DispatchQueue.main.async {
                        endofrequest(.success(games))
                    }
                }
                else{
                    DispatchQueue.main.async {
                        if let error = error {
                            guard let error = error as? URLError else {
                                endofrequest(.failure(.unknown))
                                return
                            }
                            endofrequest(.failure(.failingURL(error)))
                        }
                        else{
                            guard let response = response as? HTTPURLResponse else{
                                endofrequest(.failure(.unknown))
                                return
                            }
                            guard response.statusCode == 200 else {
                                endofrequest(.failure(.requestFailed))
                                return
                            }
                            endofrequest(.failure(.unknown))
                        }
                    }
                }
            }.resume()
        }
    
    
    
}

