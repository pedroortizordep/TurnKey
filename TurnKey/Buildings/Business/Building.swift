//
//  Building.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation

struct Building: Decodable {
    let name: String
    let address: String
//    let responsible: String
//    let initDate: String
//    let deliveryDate: String
//    let status: String
    
    enum CodingKeys: String, CodingKey {
        case name = "client_name"
        case address
//        case responsible
//        case initDate
//        case deliveryDate
//        case status
    }
}
