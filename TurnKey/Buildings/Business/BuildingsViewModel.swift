//
//  BuildingsViewModel.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation

class BuildingsViewModel {
    
    private var buildingsService: BuildingsService
    
    var allBuildings: [Building] = []
    
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
    
    func filterBuildings(filter: String) {
        
        var buildingsFiltered = allBuildings.filter { building in
            return building.clientName.contains(filter)
        }
        
        if filter.isEmpty {
            buildingsFiltered = self.allBuildings
        }
        
        buildings = buildingsFiltered
    }
    
    func filterBuildings(status: BuildingStatus) {
        
        var buildingsFiltered = allBuildings.filter { building in
            return building.status == status.rawValue
        }
        
        if status == .none {
            buildingsFiltered = self.allBuildings
        }
        
        buildings = buildingsFiltered
    }
    
    func getBuildings() {
        self.buildingsService.getBuildings { result in
            
            switch result {
            case .success(let buildings):
                self.buildings = buildings
                self.allBuildings = buildings
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
