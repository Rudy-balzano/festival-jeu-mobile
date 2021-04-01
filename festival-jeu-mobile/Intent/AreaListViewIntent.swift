//
//  AreaListViewIntent.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation
import SwiftUI

class AreaListViewIntent{
    
    @ObservedObject var areaList : AreaListViewModel
    
    var gameList : [Game] = []
    
    init(areaList : AreaListViewModel){
        self.areaList = areaList
    }
    
    func loaded(areas: [Area]){
        self.areaList.areaListState = .ready
    }
    
    func httpJsonLoaded(result : Result<[AreaData],HttpRequestError>){

        switch result {
        case let .success(data):
            let areas = LoadHelper.areaData2Area(data: data)
            areaList.areaListState = .loaded(areas)
        case let .failure(error):
            areaList.areaListState = .loadingError(error)
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
    
    func areaLoaded(){
        areaList.areaListState = .ready
    }
    
    var labelFilter: String? = nil
    
    func loadAreaList(url: String, labelFilter: String?){
        self.labelFilter = labelFilter
        areaList.areaListState = .loading(url)
        LoadHelper.loadFromAPI(url: url, endofrequest: httpJsonLoaded)
    }
        
}

