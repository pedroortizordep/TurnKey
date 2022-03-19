//
//  BuildingsService.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation
import Alamofire

class BuildingsService {
    
    private let baseURL: String = "https://secret-spire-94224.herokuapp.com"
    
    func getBuildings(completion: @escaping ([Building]) -> ()) {
        
        //        let buildings: [Building] = [
        //            Building(name: "Franklin D. Roosevelt", address: "Av. Paulista, 155", responsible: "Michael Jackson", initDate: "24/02/2022", deliveryDate: "12/03/2022", status: "Atrasada"),
        //            Building(name: "Emmanuel Macron", address: "Rua Augusta, 2345", responsible: "Robert D. Junior", initDate: "10/12/2021", deliveryDate: "01/06/2022", status: "Em andamento"),
        //            Building(name: "Barack Obama", address: "Av. 9 de Julho, 82", responsible: "Tobey Maguire", initDate: "03/01/2022", deliveryDate: "24/01/2022", status: "Concluída")
        //        ]
        
        AF.request("\(baseURL)/buildings")
            .validate()
            .responseDecodable(of: [Building].self) { (response) in
                guard let buildings = response.value else { return }
                completion(buildings)
            }
    }
}
