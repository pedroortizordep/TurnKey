//
//  NotificationsViewController.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 06/04/22.
//

import Foundation
import UIKit

class NotificationsViewController: UIViewController, ViewConfiguration {
    
    private var customView: NotificationsView = NotificationsView()
    
    private var viewModel: NotificationsViewModel = NotificationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        navigationItem.title = "Notificações"
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

extension NotificationsViewController: UITableViewDelegate {}

extension NotificationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.notifications.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 80 }
        return 116
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "notificationsCell", for: indexPath) as? NotificationsCell {
            let notification = self.viewModel.notifications[indexPath.row]
            cell.configure(notification: notification)
            return cell
        }
        
        return UITableViewCell()
    }
}
