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
        customView.setupView()
        navigationItem.title = "Nova Obra"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
