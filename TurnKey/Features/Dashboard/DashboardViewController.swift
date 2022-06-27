//
//  DashboardViewController.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 06/04/22.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController, ViewConfiguration {
    
    private var customView: DashboardView = DashboardView()
    private var viewModel: DashboardViewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
