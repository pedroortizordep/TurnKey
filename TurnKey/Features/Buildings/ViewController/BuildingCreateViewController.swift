//
//  BuildingCreateViewController.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 16/03/22.
//

import Foundation
import UIKit

class BuildingCreateViewController: UIViewController, ViewConfiguration {
    
    private var customView: BuildingCreateView = BuildingCreateView()
    private var viewModel: BuildingsViewModel = BuildingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        customView.setupView(tableDelegate: self, dataSource: self, status: [.done, .late, .notInitiated, .onGoing, .paused], delegate: self, filterDelegate: self)
        navigationItem.title = "Nova Obra"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .customBasicYellow
    }
    
    func addViews() {
        view.addSubview(customView)
    }
    
    func addConstraints() {
        customView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension BuildingCreateViewController: UITableViewDelegate {}

extension BuildingCreateViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 43
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ambientsCell", for: indexPath) as? AmbientCell {
            cell.configure()
            return cell
        }
        
        return UITableViewCell()
    }
}

extension BuildingCreateViewController: BuildingCreateDelegate {
    func createBuilding() {
        viewModel.createBuilding()
    }
}

extension BuildingCreateViewController: OptionFilterDelegate {
    func filterOption(option: String) {
        
    }
}
