//
//  StatusCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 28/03/22.
//

import Foundation
import UIKit

protocol StatusFilterDelegate {
    func filterStatus(status: BuildingStatus)
}

class StatusCell: UITableViewCell, ViewConfiguration {
    
    var delegate: StatusFilterDelegate?
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonDone = UIButton()
    private lazy var buttonOnGoing = UIButton()
    private lazy var buttonLate = UIButton()
    private lazy var buttonPaused = UIButton()
    private lazy var buttonNotInitiated = UIButton()
    
    private var buttons: [UIButton] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .magenta
    }
    
    func configure(delegate: StatusFilterDelegate) {
        self.delegate = delegate
        buttons = [buttonDone, buttonOnGoing, buttonLate, buttonPaused, buttonNotInitiated]
        
        var statusTypes: [BuildingStatus] = [.done, .onGoing, .late, .paused, .notInitiated]
        
        buttons.forEach { button in
            button.applyStyle(title: statusTypes.removeFirst().rawValue, bgColor: .customButtonBackGroundGray, fontName: .nunitoBold, size: 10)
            
            if button.isSelected {
                button.backgroundColor = .customBasicYellow
            }
            
            button.addTarget(self, action: #selector(didTapStatus), for: .touchUpInside)
            button.layer.cornerRadius = 4
        }
        
        initialize()
    }
    
    @objc func didTapStatus(sender: UIButton) {
        
        buttons.forEach { button in
            button.backgroundColor = .customButtonBackGroundGray
            if button != sender { button.isSelected = false }
        }
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected { sender.backgroundColor = .customBasicYellow } else {
            sender.backgroundColor = .customButtonBackGroundGray
        }
        
        if let status = BuildingStatus(rawValue: sender.title(for: .normal) ?? "") {
            
            if sender.isSelected { delegate?.filterStatus(status: status) } else {
                delegate?.filterStatus(status: .none)
            }
            
        }
    }
    
    func addViews() {
        addSubview(viewContainer)
        
        buttons.forEach { button in
            viewContainer.addSubview(button)
        }
    }
    
    func addConstraints() {
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        buttonOnGoing.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor).isActive = true
        buttonOnGoing.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        buttonOnGoing.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonOnGoing.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonDone.trailingAnchor.constraint(equalTo: buttonOnGoing.leadingAnchor, constant: -15).isActive = true
        buttonDone.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        buttonDone.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonDone.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonLate.leadingAnchor.constraint(equalTo: buttonOnGoing.trailingAnchor, constant: 15).isActive = true
        buttonLate.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        buttonLate.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonLate.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonPaused.centerXAnchor.constraint(equalTo: buttonDone.centerXAnchor, constant: 47).isActive = true
        buttonPaused.topAnchor.constraint(equalTo: buttonDone.bottomAnchor, constant: 8).isActive = true
        buttonPaused.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonPaused.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        buttonNotInitiated.centerXAnchor.constraint(equalTo: buttonLate.centerXAnchor, constant: -47).isActive = true
        buttonNotInitiated.topAnchor.constraint(equalTo: buttonLate.bottomAnchor, constant: 8).isActive = true
        buttonNotInitiated.widthAnchor.constraint(equalToConstant: 80).isActive = true
        buttonNotInitiated.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

