//
//  AreaListViewModel.swift
//  festival-jeu-mobile
//
//  Created by Emilie Jean on 01/04/2021.
//

import Foundation
import SwiftUI
import Combine

enum AreaListState: CustomStringConvertible{
    case ready
    case loading(String)
    case loaded([Area])
    case loadingError(Error)
    case newAreas([AreaViewModel])
    
    var description: String{
        switch self {
        case .ready : return "ready"
        case .loading(let s) : return "Loading \(s)"
        case .loaded(let areas) : return "Loaded \(areas.count) areas"
        case .loadingError(let error) : return "Loading error : Error Loading -> \(error)"
        case .newAreas(let areas) : return "New areas : reset area with \(areas.count) areas"
        }
    }
}

class AreaListViewModel: ObservableObject, AreaListDelegate{
    
    private(set) var model : AreaList
    
    @Published private(set) var areas = [AreaViewModel]()
    
    @Published var formViewOpen = false
    
    @Published var areaListState : AreaListState = .ready{
        didSet{
            switch self.areaListState {
            case let .loaded(data):
                self.formViewOpen = false
                self.model.new(areas: data)
            case .loadingError:
                self.formViewOpen = true
            default:
                return
            }
        }
    }
    
    init(_ areaList: AreaList){
        self.model = areaList
        self.model.delegate = self
    }
    
    func new(areas: [Area]){
        self.model.new(areas: areas)
    }
    
    func removeAllAreas(){
        self.model.removeAllAreas()
    }
    
    func areaListDeleted() {
        self.areas.removeAll()
    }
    
    func newAreaList() {
        self.areas.removeAll()
        for area in self.model.areas{
            self.areas.append(AreaViewModel(area))
        }
        self.areaListState = .newAreas(self.areas)
    }
}
