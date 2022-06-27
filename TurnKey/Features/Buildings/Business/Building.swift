//
//  Building.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation

struct Building: Decodable {
    var id: Int? = nil
    let clientName: String
    let buildingName: String
    let responsibleName: String
    let beginDate: String
    let deliveryDate: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case clientName = "client_name"
        case buildingName = "building_name"
        case responsibleName = "responsible_name"
        case beginDate = "begin_date"
        case deliveryDate = "delivery_date"
        case status
    }
}
