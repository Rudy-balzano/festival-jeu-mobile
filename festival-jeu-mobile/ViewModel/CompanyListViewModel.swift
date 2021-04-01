//
//  CompanyListViewModel.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation
import SwiftUI
import Combine

enum CompanyListState: CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Company])
    case loadingError(Error)
    case newCompanies([CompanyViewModel])
    
    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "Loading \(s)"
        case .loaded(let companies) : return "Loaded \(companies.count) companies"
        case .loadingError(let error) : return "Loading error : Error Loading -> \(error)"
        case .newCompanies(let companies) : return "New companies : reset company with \(companies.count) companies"
        }
    }
}

class CompanyListViewModel: ObservableObject, CompanyListDelegate{
    
    private(set) var model : CompanyList
    
    @Published private(set) var companies = [CompanyViewModel]()
    
    @Published var formViewOpen = false
    
    @Published var companyListState : CompanyListState = .ready{
        didSet{
            switch self.companyListState {
            case let .loaded(data):
                self.formViewOpen = false
                self.model.new(companies: data)
            case .loadingError:
                self.formViewOpen = true
            default:
                return
            }
        }
    }
    
    init(_ companyList: CompanyList){
        self.model = companyList
        self.model.delegate = self
    }
    
    func new(companies: [Company]){
        self.model.new(companies: companies)
    }
    
    func removeAllCompanies(){
        self.model.removeAllCompanies()
    }
    
    func companyListDeleted() {
        self.companies.removeAll()
    }
    
    func newCompanyList() {
        self.companies.removeAll()
        for company in self.model.companies{
            self.companies.append(CompanyViewModel(company))
        }
        self.companyListState = .newCompanies(self.companies)
    }
}
