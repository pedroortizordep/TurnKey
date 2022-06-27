//
//  NotificationsView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 06/04/22.
//

import Foundation
import UIKit

class NotificationsView: UIView, ViewConfiguration {
    
    lazy var tableViewNotifications: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(NotificationsCell.self, forCellReuseIdentifier: "notificationsCell")
        return tableView
    }()
    
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
        addSubview(tableViewNotifications)
    }
    
    func addConstraints() {
        tableViewNotifications.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableViewNotifications.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableViewNotifications.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableViewNotifications.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
