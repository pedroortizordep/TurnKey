//
//  BuildingsCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 13/03/22.
//

import Foundation
import UIKit

class BuildingsCell: UITableViewCell, ViewConfiguration {
    
    private lazy var imageViewLocation: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "location")
        return imageView
    }()
    
    private lazy var labelBuildName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 17)
        return label
    }()

    private lazy var labelClientName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var labelResponsibleName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var labelDeadline: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var labelStatus: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var imageViewStatus: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(building: Building) {
        labelBuildName.text = building.buildingName
        labelClientName.text = building.clientName
        labelResponsibleName.text = building.responsibleName
        labelDeadline.text = "\(building.beginDate) - \(building.deliveryDate)"
        labelStatus.text = building.status
        imageViewStatus.image = UIImage(named: "atrasada")
        initialize()
    }
    
    func addViews() {
        addSubview(imageViewLocation)
        addSubview(labelBuildName)
        addSubview(labelClientName)
        addSubview(labelResponsibleName)
        addSubview(labelDeadline)
    }
    
    func addConstraints() {
        imageViewLocation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        imageViewLocation.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        imageViewLocation.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageViewLocation.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        labelBuildName.leadingAnchor.constraint(equalTo: imageViewLocation.trailingAnchor).isActive = true
        labelBuildName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        
        labelClientName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        labelClientName.topAnchor.constraint(equalTo: labelBuildName.bottomAnchor, constant: 8).isActive = true
        
        labelResponsibleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        labelResponsibleName.topAnchor.constraint(equalTo: labelClientName.bottomAnchor, constant: 8).isActive = true
        
        labelDeadline.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        labelDeadline.topAnchor.constraint(equalTo: labelResponsibleName.bottomAnchor, constant: 16).isActive = true
    }
}

