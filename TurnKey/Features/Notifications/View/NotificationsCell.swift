//
//  NotificationsCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 06/04/22.
//

import Foundation
import UIKit

class NotificationsCell: UITableViewCell, ViewConfiguration {
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(notification: BuildingNotification) {
        initialize()
        
        
    }
    
    func addViews() {
        addSubview(viewContainer)
    }
    
    func addConstraints() {
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

