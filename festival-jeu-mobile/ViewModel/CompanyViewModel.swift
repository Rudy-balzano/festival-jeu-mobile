//
//  CompanyViewModel.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation
import SwiftUI

class CompanyViewModel: Identifiable {
    
    @ObservedObject private(set) var model : Company
    
    var id : Int{
        return model.id
    }
    
    var name : String{
        return model.name
    }
    
    init(_ company : Company){
        self.model = company
    }
}
