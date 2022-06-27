//
//  BuildingsService.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation
import Alamofire

class BuildingsService: Service {
    
    private let baseURL: String = "https://secret-spire-94224.herokuapp.com"
    
    func getBuildings(completion: @escaping (Result<[Building], Error>) -> ()) {
        
        if USING_MOCK {
            parseJSON(of: [Building].self, jsonFileName: "buildings") { result in
                switch result {
                case .success(let buildings):
                    completion(.success(buildings))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        } else {
            AF.request("\(baseURL)/buildings")
                .validate()
                .responseDecodable(of: [Building].self) { (response) in

                    if let error = response.error {
                        completion(.failure(error))
                    }

                    guard let buildings = response.value else { return }
                    completion(.success(buildings))
                }
        }
    }
    
    func createBuilding(building: Building, completion: @escaping (Result<Building, Error>) -> ()) {
        
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        
        let parameters: [String: Any] = [
            "client_name": building.clientName,
            "building_name": building.buildingName,
            "responsible_name": building.responsibleName,
            "begin_date": building.beginDate,
            "delivery_date": building.deliveryDate,
            "status": building.status
        ]
        
        AF.request("\(baseURL)/building_create", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: Building.self) { response in
                
                if let error = response.error {
                    completion(.failure(error))
                }
                
                guard let building = response.value else { return }
                completion(.success(building))
            }
    }
}
