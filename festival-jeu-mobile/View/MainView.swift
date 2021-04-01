//
//  MainView.swift
//  festival-jeu-mobile
//
//  Created by Rudy Balzano on 31/03/2021.
//

import SwiftUI

struct MainView: View {
    @State private var tabSelected  = 1
    
//    @StateObject var gameList : GameListViewModel = GameListViewModel(GameList())
    
    var body: some View {
        TabView(selection: $tabSelected){
            GameListView(gameList: GameListViewModel(GameList()))
                .tabItem{
                    Label("Games", systemImage: "list.triangle")
                }.tag(0)
            AreaListView(areaList: AreaListViewModel(AreaList()))
                .tabItem{
                    Label("Areas", systemImage: "paperplane")
                }.tag(1)
            CompanyListView(companyList: CompanyListViewModel(CompanyList()))
                .tabItem{
                    Label("Companies", systemImage: "person.fill")
                }.tag(2)
        }
        //GameListView(gameList: GameListViewModel(GameList()))
       // AreaListView(areaList: AreaListViewModel(AreaList()))
        //CompanyListView(companyList: CompanyListViewModel(CompanyList()))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
