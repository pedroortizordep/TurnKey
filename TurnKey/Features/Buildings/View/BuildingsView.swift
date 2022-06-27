//
//  BuildingsView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation
import UIKit

class BuildingsView: BaseView, ViewConfiguration {

    lazy var tableViewBuildings: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(StatusCell.self, forCellReuseIdentifier: "statusCell")
        tableView.register(BuildingsCell.self, forCellReuseIdentifier: "buildingsCell")
        return tableView
    }()
    
    lazy var viewNotFoundError: NotFoundErrorView = {
        let view = NotFoundErrorView()
        view.isHidden = true
        return view
    }()
    
    override init() {
        super.init()
        backgroundColor = .white
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableViewBuildings.delegate = delegate
        tableViewBuildings.dataSource = dataSource
        
        initialize()
        viewNotFoundError.setupView(color: .customButtonBackGroundGray, message: "Nenhuma\nobra encontrada")
    }
    
    func showError(error: TurnKeyError) {
        switch error {
        case .notFound:
            tableViewBuildings.isHidden = true
            viewNotFoundError.isHidden = false
        case .none:
            tableViewBuildings.isHidden = false
            viewNotFoundError.isHidden = true
        default:
            break
        }
    }
    
    func addViews() {
        addSubview(tableViewBuildings)
        addSubview(viewNotFoundError)
    }
    
    func addConstraints() {
        tableViewBuildings.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableViewBuildings.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableViewBuildings.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableViewBuildings.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        viewNotFoundError.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewNotFoundError.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        viewNotFoundError.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewNotFoundError.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
