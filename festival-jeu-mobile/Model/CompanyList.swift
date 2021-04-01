//
//  CompanyList.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation

protocol CompanyListDelegate {
    func newCompanyList()
    func companyListDeleted()
}

class CompanyList: ObservableObject {
    
    var delegate: CompanyListDelegate?
    
    private(set) var companies : [Company]
    
    init(){
        self.companies = []
    }
    
    func new(companies: [Company]){
        self.companies = companies
        self.delegate?.newCompanyList()
    }
    
    func removeAllCompanies(){
        self.companies.removeAll()
        self.delegate?.companyListDeleted()
    }
}

