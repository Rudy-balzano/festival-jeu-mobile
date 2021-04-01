//
//  AreaList.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation

protocol AreaListDelegate {
    func newAreaList()
    func areaListDeleted()
}

class AreaList: ObservableObject {
    
    var delegate: AreaListDelegate?
    
    private(set) var areas : [Area]
    
    init(){
        self.areas = []
    }
    
    func new(areas: [Area]){
        self.areas = areas
        self.delegate?.newAreaList()
    }
    
    func removeAllAreas(){
        self.areas.removeAll()
        self.delegate?.areaListDeleted()
    }
}
