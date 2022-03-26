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
            self.bindBuildingsViewModelToController()
        }
    }
    
    private(set) var newBuilding: Building? {
        didSet {
            self.bindNewBuildingViewModelToController()
        }
    }
    
    var bindBuildingsViewModelToController: (() -> ()) = {}
    var bindNewBuildingViewModelToController: (() -> ()) = {}
    
    init() {
        buildingsService = BuildingsService()
        buildings = []
    }
    
    func getBuildings() {
        self.buildingsService.getBuildings { result in
            
            switch result {
            case .success(let buildings):
                self.buildings = buildings
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
    func createBuilding() {
        self.buildingsService.createBuilding(building: Building(clientName: "Pedro", buildingName: "Casa Pedro", responsibleName: "Grazi", beginDate: "03/02/2022", deliveryDate: "05/05/2022", status: "Em andamento")) { result in
            
            switch result {
            case .success(let newBuilding):
                self.newBuilding = newBuilding
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
