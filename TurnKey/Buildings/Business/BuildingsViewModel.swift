//
//  BuildingsViewModel.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation

class BuildingsViewModel {
    
    private var buildingsService: BuildingsService
    
    private(set) var buildings: [Building] {
        didSet {
            self.bindBuildingViewModelToController()
        }
    }
    
    var bindBuildingViewModelToController: (() -> ()) = {}
    
    init() {
        buildingsService = BuildingsService()
        buildings = []
    }
    
    func getBuildings() {
        self.buildingsService.getBuildings { buildings in
            self.buildings = buildings
        }
    }
}
