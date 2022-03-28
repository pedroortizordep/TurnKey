//
//  Enums.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 13/03/22.
//

import Foundation

enum FontName: String {
    case nunitoBold = "Nunito-Bold"
    case nunitoSemiBold = "Nunito-SemiBold"
    case nunitoRegular = "Nunito-Regular"
    case nunitoLight = "Nunito-Light"
}

enum BuildingStatus: String {
    case late = "Atrasada"
    case onGoing = "Em andamento"
    case done = "Concluída"
    case paused = "Pausada"
    case notInitiated = "Não iniciada"
    case none
}
