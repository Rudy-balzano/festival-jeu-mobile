//
//  CompanyListViewIntent.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation
import SwiftUI

class CompanyListViewIntent{
    
    @ObservedObject var companyList : CompanyListViewModel
    var gameList : [Game] = []
    
    init(companyList : CompanyListViewModel){
        self.companyList = companyList
    }
    
    func loaded(companies: [Company]){
        self.companyList.companyListState = .ready
    }
    
    func httpJsonLoaded(result : Result<[CompanyData],HttpRequestError>){

        switch result {
        case let .success(data):
            let companies = LoadHelper.companyData2Company(data: data)
            companyList.companyListState = .loaded(companies)
        case let .failure(error):
            companyList.companyListState = .loadingError(error)
        }
    }
    func gameLoaded(result : Result<[GameData],HttpRequestError>){
        switch result {
        case let .success(data):
            self.gameList = LoadHelper.gameData2Game(data: data)
        case .failure(_):
            self.gameList = []
        }
    }
    
    func companyLoaded(){
        companyList.companyListState = .ready
    }
    
    var nameFilter: String? = nil
    
    func loadCompanyList(url: String, nameFilter: String?){
        self.nameFilter = nameFilter
        companyList.companyListState = .loading(url)
        LoadHelper.loadFromAPI(url: url, endofrequest: httpJsonLoaded)
    }
    
    func getGamesForCompany(company: CompanyViewModel) -> GameListViewModel{
        
        let url = "http://localhost:3000/festival/current/reserved-games"
        
        let gameList = GameList()
        
        LoadHelper.loadFromAPI(url: url, endofrequest: gameLoaded)
        
        for g in self.gameList {
            if(g.publisher == company.name){
                gameList.addGame(game: g)
            }
        }
        
        let gameListVM = GameListViewModel(gameList)
        return gameListVM
        
    }
}
