//
//  BuildingsCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 13/03/22.
//

import Foundation
import UIKit

class BuildingsCell: UITableViewCell, ViewConfiguration {
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageViewLocation: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Location")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelBuildName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 17)
        return label
    }()

    private lazy var labelClientName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .customTextGray, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var labelResponsibleName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .customTextGray, fontName: .nunitoSemiBold, size: 10)
        return label
    }()
    
    private lazy var labelDeadline: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .customTextGray, fontName: .nunitoSemiBold, size: 10)
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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(building: Building) {
        initialize()
        
        labelBuildName.text = building.buildingName
        labelClientName.text = building.clientName
        labelResponsibleName.text = building.responsibleName
        labelDeadline.text = "\(building.beginDate) - \(building.deliveryDate)"
        labelStatus.text = building.status
        
        configureShadow()
        
        guard let status = BuildingStatus(rawValue: building.status) else { return }
        configureStatus(status: status)
    }
    
    private func configureStatus(status: BuildingStatus) {
        imageViewStatus.image = UIImage(named: status.rawValue)
        
        var labelColor: UIColor = .black
        
        switch status {
        case .late:
            labelColor = .customBasicRed
        case .onGoing:
            labelColor = .customBasicYellow
        case .done:
            labelColor = .customBasicGreen
        case .paused:
            labelColor = .blue
        case .notInitiated:
            labelColor = .customTextGray
        default: break
        }
        
        imageViewStatus.tintColor = labelColor
        labelStatus.textColor = labelColor
    }
    
    private func configureShadow() {
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.shadowOpacity = 0.2
        viewContainer.layer.shadowOffset = .zero
        viewContainer.layer.shadowRadius = 8
    }
    
    func addViews() {
        addSubview(viewContainer)
        viewContainer.addSubview(imageViewLocation)
        viewContainer.addSubview(labelBuildName)
        viewContainer.addSubview(labelClientName)
        viewContainer.addSubview(labelResponsibleName)
        viewContainer.addSubview(labelDeadline)
        viewContainer.addSubview(imageViewStatus)
        viewContainer.addSubview(labelStatus)
    }
    
    func addConstraints() {
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageViewLocation.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 4).isActive = true
        imageViewLocation.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 8).isActive = true
        imageViewLocation.widthAnchor.constraint(equalToConstant: 24).isActive = true
        imageViewLocation.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        labelBuildName.leadingAnchor.constraint(equalTo: imageViewLocation.trailingAnchor).isActive = true
        labelBuildName.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 12).isActive = true
        
        labelClientName.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 8).isActive = true
        labelClientName.topAnchor.constraint(equalTo: labelBuildName.bottomAnchor, constant: 6).isActive = true
        
        labelResponsibleName.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 8).isActive = true
        labelResponsibleName.topAnchor.constraint(equalTo: labelClientName.bottomAnchor).isActive = true
        
        labelDeadline.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 8).isActive = true
        labelDeadline.topAnchor.constraint(equalTo: labelResponsibleName.bottomAnchor, constant: 12).isActive = true
        
        imageViewStatus.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -8).isActive = true
        imageViewStatus.centerYAnchor.constraint(equalTo: labelDeadline.centerYAnchor).isActive = true
        imageViewStatus.widthAnchor.constraint(equalToConstant: 14).isActive = true
        imageViewStatus.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        labelStatus.trailingAnchor.constraint(equalTo: imageViewStatus.leadingAnchor, constant: -4).isActive = true
        labelStatus.centerYAnchor.constraint(equalTo: labelDeadline.centerYAnchor).isActive = true
    }
}

