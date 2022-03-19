//
//  BuildingsCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 13/03/22.
//

import Foundation
import UIKit

class BuildingsCell: UITableViewCell, ViewConfiguration {

    private lazy var labelBuildAddress: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoLight, size: 14)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(building: Building) {
        labelBuildAddress.text = building.address
        initialize()
    }
    
    func addViews() {
        addSubview(labelBuildAddress)
    }
    
    func addConstraints() {
        labelBuildAddress.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        labelBuildAddress.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    }
}

