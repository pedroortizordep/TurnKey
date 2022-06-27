//
//  StatusCell.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 28/03/22.
//

import Foundation
import UIKit

protocol OptionFilterDelegate {
    func filterOption(option: String)
}

class FilterOptionView: UIView, ViewConfiguration {
    
    private var buttons: [UIButton] = []
    
    var delegate: OptionFilterDelegate?
    
    func configure(options: [String], delegate: OptionFilterDelegate) {
        self.delegate = delegate
        
        if buttons.isEmpty {
            options.forEach { option in
                
                let button = UIButton()
                button.applyStyle(title: option, bgColor: .customButtonBackGroundGray, fontName: .nunitoBold, size: 10)
                
                button.addTarget(self, action: #selector(didTapOption(sender:)), for: .touchUpInside)
                button.layer.cornerRadius = 4
                button.translatesAutoresizingMaskIntoConstraints = false
                
                buttons.append(button)
            }
            
            initialize()
        }
    }
    
    @objc func didTapOption(sender: UIButton) {
        buttons.forEach { button in
            button.backgroundColor = .customButtonBackGroundGray
            if button != sender { button.isSelected = false }
        }
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected { sender.backgroundColor = .customBasicYellow } else {
            sender.backgroundColor = .customButtonBackGroundGray
        }
        
        delegate?.filterOption(option: sender.title(for: .normal) ?? "")
    }
    
    func addViews() {
        buttons.forEach { button in
            addSubview(button)
        }
    }
    
    func addConstraints() {
        
        var leading: CGFloat = 24
        var top: CGFloat = 8
        
        buttons.forEach { button in
            
            if leading > (UIScreen.main.bounds.width / 2) {
                leading = 24
                top += 36
            }
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leading).isActive = true
            button.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
            button.widthAnchor.constraint(equalToConstant: 80).isActive = true
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true
            
            leading += 88
        }
    }
}

class StatusCell: UITableViewCell, ViewConfiguration {
    
    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewOptions: FilterOptionView = {
        let view = FilterOptionView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var buttons: [UIButton] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .magenta
    }
    
    func configure(status: [BuildingStatus], delegate: OptionFilterDelegate) {
        var options: [String] = []
        
        status.forEach { status in
            options.append(status.rawValue)
        }
        
        initialize()
        viewOptions.configure(options: options, delegate: delegate)
    }
    
    func addViews() {
        addSubview(viewContainer)
        viewContainer.addSubview(viewOptions)
    }
    
    func addConstraints() {
        viewContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        viewContainer.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        viewContainer.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        viewOptions.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor).isActive = true
        viewOptions.topAnchor.constraint(equalTo: viewContainer.topAnchor).isActive = true
        viewOptions.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        viewOptions.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
    }
}

