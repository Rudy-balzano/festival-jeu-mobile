//
//  CompanyListView.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import SwiftUI

struct CompanyListView: View {
    
    @ObservedObject var companyList : CompanyListViewModel
    var intent : CompanyListViewIntent
    
    
    private var url: String = "http://localhost:3000/festival/current/publishers"
    
    init(companyList : CompanyListViewModel){
        self.companyList = companyList
        self.intent = CompanyListViewIntent(companyList: companyList)
        let _ = self.companyList.$companyListState.sink(receiveValue: stateChanged)
        
        self.intent.loadCompanyList(url: url, nameFilter: nil)
    }
    
    private var searchState : CompanyListState{
        return self.companyList.companyListState
    }
    
    @State private var showModel = false
    @State var detailPresented = false
    @State var revealSearchForm = false
    @State var textSearch = ""
    
    var companies : [CompanyViewModel]{
        return self.companyList.companies
    }
    
    private func filterSearch(company: CompanyViewModel) -> Bool{
        var ret = true
        if !textSearch.isEmpty {
            ret = false
            ret = ret || company.name.contains(textSearch)
            
        }
        return ret
    }
    
    func stateChanged(state: CompanyListState){
        switch state {
        case .newCompanies:
            self.intent.companyLoaded()
        default:
            break
        }
    }
    
    var body: some View {
        return NavigationView{
            VStack{
                TextField("Company filter", text: $textSearch).font(.footnote)
                Spacer()
                ZStack{
                    List{
                        ForEach( self.companyList.companies.filter(filterSearch)){ company in
                            NavigationLink(destination: GameListView(company: company)){
                                Text(company.model.name)
                                
                            }
                        }
                    }
                }
            }.navigationTitle("List of companies")
        }
    }
}
