//
//  AreaListView.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import SwiftUI

struct AreaListView: View {
    
    @ObservedObject var areaList : AreaListViewModel
    var intent : AreaListViewIntent
    
    
    private var url: String = "http://localhost:3000/festival/current/areas"
    
    init(areaList : AreaListViewModel){
        self.areaList = areaList
        self.intent = AreaListViewIntent(areaList: areaList)
        let _ = self.areaList.$areaListState.sink(receiveValue: stateChanged)
        
        self.intent.loadAreaList(url: url, labelFilter: nil)
    }
    
    private var searchState : AreaListState{
        return self.areaList.areaListState
    }
    
    @State private var showModel = false
    @State var detailPresented = false
    @State var revealSearchForm = false
    @State var textSearch = ""
    
    var areas : [AreaViewModel]{
        return self.areaList.areas
    }
    
    private func filterSearch(area: AreaViewModel) -> Bool{
        var ret = true
        if !textSearch.isEmpty {
            ret = false
            ret = ret || area.label.contains(textSearch)
            
        }
        return ret
    }
    
    func stateChanged(state: AreaListState){
        switch state {
        case .newAreas:
            self.intent.areaLoaded()
        default:
            break
        }
    }
    
    var body: some View {
        return NavigationView{
            VStack{
                TextField("Area filter", text: $textSearch).font(.footnote)
                Spacer()
                ZStack{
                    List{
                        ForEach( self.areaList.areas.filter(filterSearch)){ area in
                            NavigationLink(destination: GameForAreaListView(gameList: gameList, area:area))){
                              Text(area.model.label)

                            }
                        }
                    }
                }
            }.navigationTitle("List of areas")
        }
    }
}
