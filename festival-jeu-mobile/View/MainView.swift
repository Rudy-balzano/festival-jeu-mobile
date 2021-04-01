//
//  MainView.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 31/03/2021.
//

import SwiftUI

struct MainView: View {
    
//    @StateObject var gameList : GameListViewModel = GameListViewModel(GameList())
    
    var body: some View {
        //GameListView(gameList: GameListViewModel(GameList()))
        AreaListView(areaList: AreaListViewModel(AreaList()))
        //CompanyListView(companyList: CompanyListViewModel(CompanyList()))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
