//
//  AreaViewModel.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//
import Foundation
import SwiftUI

class AreaViewModel: Identifiable {
    
    @ObservedObject private(set) var model : Area
    
    var id : Int{
        return model.id
    }
    
    var label : String{
        return model.label
    }
    
    init(_ area : Area){
        self.model = area
    }
}
