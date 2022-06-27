//
//  FormTextView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 19/03/22.
//

import Foundation
import UIKit

class FormTextView: UIView, ViewConfiguration {
    
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 10)
        return label
    }()
    
    lazy var textFieldValue: UITextField = {
        let textField = UITextField()
        textField.applyStyle(bgColor: .clear, fontName: .nunitoSemiBold, size: 16)
        return textField
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .customLightBackGroundGray
        return view
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        setupView(title: title, placeholder: placeholder)
    }
    
    func setupView(title: String, placeholder: String) {
        initialize()
        labelTitle.text = title
        textFieldValue.placeholder = placeholder
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(labelTitle)
        addSubview(textFieldValue)
        addSubview(lineView)
    }
    
    func addConstraints() {
        labelTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true

        textFieldValue.topAnchor.constraint(equalTo: labelTitle.bottomAnchor).isActive = true
        textFieldValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26).isActive = true
        textFieldValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26).isActive = true
        textFieldValue.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        lineView.topAnchor.constraint(equalTo: textFieldValue.bottomAnchor, constant: -6).isActive = true
        lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
