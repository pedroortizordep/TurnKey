//
//  AmbientCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 27/06/22.
//

import Foundation
import UIKit

class AmbientCell: UITableViewCell, ViewConfiguration {
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.customLightBackGroundGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelAmbientName: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 17)
        return label
    }()
    
    lazy var buttonEdit: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Location"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonDelete: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Location"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        initialize()
        labelAmbientName.text = "Quarto"
    }
    
    func addViews() {
        addSubview(viewContainer)
        viewContainer.addSubview(labelAmbientName)
        viewContainer.addSubview(buttonEdit)
        viewContainer.addSubview(buttonDelete)
    }
    
    func addConstraints() {
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        labelAmbientName.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 12).isActive = true
        labelAmbientName.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        
        buttonDelete.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -16).isActive = true
        buttonDelete.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        buttonDelete.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonDelete.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        buttonEdit.trailingAnchor.constraint(equalTo: buttonDelete.leadingAnchor, constant: -16).isActive = true
        buttonEdit.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        buttonEdit.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonEdit.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
}

