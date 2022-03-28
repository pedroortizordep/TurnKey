//
//  BuildingsView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation
import UIKit

class BuildingsView: UIView, ViewConfiguration {

    lazy var tableViewBuildings: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(StatusCell.self, forCellReuseIdentifier: "statusCell")
        tableView.register(BuildingsCell.self, forCellReuseIdentifier: "buildingsCell")
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
    }
    
    func setupView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableViewBuildings.delegate = delegate
        tableViewBuildings.dataSource = dataSource
        
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(tableViewBuildings)
    }
    
    func addConstraints() {
        tableViewBuildings.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableViewBuildings.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableViewBuildings.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableViewBuildings.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
