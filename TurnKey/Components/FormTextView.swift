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
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 16)
        return label
    }()
    
    lazy var textFieldValue: UITextField = {
        let textField = UITextField()
        textField.applyStyle(bgColor: .customBackGroundGray, fontName: .nunitoSemiBold, size: 12)
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
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
    }
    
    func addConstraints() {
        labelTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 24).isActive = true

        textFieldValue.topAnchor.constraint(equalTo: labelTitle.bottomAnchor).isActive = true
        textFieldValue.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        textFieldValue.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        textFieldValue.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
