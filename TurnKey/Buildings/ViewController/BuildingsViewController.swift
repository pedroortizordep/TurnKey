//
//  BuildingsViewController.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 12/03/22.
//

import Foundation
import UIKit

class BuildingsViewController: UIViewController, ViewConfiguration {
    
    private var customView: BuildingsView = BuildingsView()
    private var viewModel: BuildingsViewModel = BuildingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getBuildings()
    }
    
    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(goToBuildingCreate)
        )
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        initialize()
        customView.setupView(delegate: self, dataSource: self)
        bindBuildings()
    }
    
    @objc func goToBuildingCreate() {
        let viewController = BuildingCreateViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func bindBuildings() {
        viewModel.bindBuildingViewModelToController = {
            self.customView.tableViewBuildings.reloadData()
        }
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

extension BuildingsViewController: UITableViewDelegate {}

extension BuildingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.buildings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "buildingsCell", for: indexPath) as? BuildingsCell {
            let building = self.viewModel.buildings[indexPath.row]
            cell.configure(building: building)
            return cell
        }
        
        return UITableViewCell()
    }
}
