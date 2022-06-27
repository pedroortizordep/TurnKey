//
//  DashboardView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 06/04/22.
//

import Foundation
import UIKit

class DashboardView: UIView, ViewConfiguration {
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        
    }
    
    func addConstraints() {
        
    }
}
