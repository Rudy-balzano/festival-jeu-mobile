//
//  LoadHelper.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 24/03/2021.
//

import Foundation

struct GameData : Decodable {
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
struct AreaData : Decodable {
    var id : Int
    var label : String
    
}
struct CompanyData : Decodable {
    var id : Int
    var name : String
}

struct LoadHelper {
    
    static func gameData2Game(data: [GameData]) -> [Game]{
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
    
    static func areaData2Area(data: [AreaData]) -> [Area]{
        var areas = [Area]()
        for gdata in data{
            let area : Area
            area = Area(id: gdata.id, label: gdata.label)
            areas.append(area)
        }
            return areas
    }
    static func companyData2Company(data: [CompanyData]) -> [Company]{
        var companies = [Company]()
        for gdata in data{
            let company : Company
            company = Company(id: gdata.id, name: gdata.name)
            companies.append(company)
        }
            return companies
    }
    
    
    static func loadFromAPI<T : Decodable>(url surl: String, endofrequest: @escaping (Result<[T],HttpRequestError>) -> Void){
            guard let url = URL(string: surl) else {
                endofrequest(.failure(.badURL(surl)))
                return
            }
            self.loadFromAPI(url: url, endofrequest: endofrequest)
        }
    
    static func loadFromAPI<T: Decodable>(url: URL, endofrequest: @escaping (Result<[T],HttpRequestError>) -> Void){
            self.loadFromJsonData(url: url, endofrequest: endofrequest)
        }

    private static func loadFromJsonData<T: Decodable>(url: URL, endofrequest: @escaping (Result<[T],HttpRequestError>) -> Void){
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decodedData : Decodable?
                    decodedData = try? JSONDecoder().decode([T].self, from: data)
                    guard let decodedResponse = decodedData else {
                        DispatchQueue.main.async { endofrequest(.failure(.JsonDecodingFailed)) }
                        return
                    }
                    let tData : [T] = (decodedResponse as! [T])
                    DispatchQueue.main.async {
                        endofrequest(.success(tData))
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

