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
    private let searchController = UISearchController()
    private var viewModel: BuildingsViewModel = BuildingsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.getBuildings()
    }
    
    private func setup() {
        navigationItem.title = "Obras"
        
        setupNavigation()
        setupSearchBar()
        
        initialize()
        customView.setupView(delegate: self, dataSource: self)
        bindBuildings()
        bindNewBuilding()
        bindErrorView()
    }
    
    private func setupNavigation() {
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                barButtonSystemItem: .add,
                target: self,
                action: #selector(goToBuildingCreate)
            ),
            UIBarButtonItem(
                image: UIImage(named: "Notification"),
                style: .plain,
                target: self,
                action: #selector(goToNotifications)
            )
        ]
        
        navigationItem.rightBarButtonItems?.forEach({ item in
            item.tintColor = .customBasicYellow
        })
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.tintColor = .customBasicYellow
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func goToBuildingCreate() {
        let viewController = BuildingCreateViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func goToNotifications() {
        let viewController = NotificationsViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func bindBuildings() {
        viewModel.bindBuildingsViewModelToController = {
            self.customView.tableViewBuildings.reloadData()
        }
    }
    
    func bindNewBuilding() {
        viewModel.bindNewBuildingViewModelToController = {
            
        }
    }
    
    func bindErrorView() {
        viewModel.bindErrorViewModelToController = {
            self.customView.showError(error: self.viewModel.errorState ?? .generic)
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
        return viewModel.buildings.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 80 }
        return 116
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "statusCell", for: indexPath) as? StatusCell {
                cell.configure(status: [.done, .late, .notInitiated, .onGoing, .paused], delegate: self)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "buildingsCell", for: indexPath) as? BuildingsCell {
                let building = self.viewModel.buildings[indexPath.row - 1]
                cell.configure(building: building)
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

extension BuildingsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.filterBuildings(filter: text)
    }
}

extension BuildingsViewController: OptionFilterDelegate {
    func filterOption(option: String) {
        guard let buildingStatus = BuildingStatus(rawValue: option) else { return }
        viewModel.filterBuildings(status: buildingStatus)
    }
}
