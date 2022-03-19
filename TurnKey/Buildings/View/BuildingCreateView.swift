//
//  BuildingCreateView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 16/03/22.
//

import Foundation
import UIKit

protocol BuildingCreateDelegate: AnyObject {
    func createBuilding()
}

class BuildingCreateView: UIView, ViewConfiguration {
    
    weak var delegate: BuildingCreateDelegate?

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var formTextViewClientName = FormTextView()
    lazy var formTextViewResponsableName = FormTextView()
    lazy var formTextViewAddress = FormTextView()
    lazy var formTextViewDateInit = FormTextView()
    lazy var formTextViewDateDelivery = FormTextView()
    
    var formTextViews: [FormTextView] = []
    
    lazy var buttonAdd: UIButton = {
        let button = UIButton()
        button.applyStyle(title: "Adicionar", bgColor: .customBasicYellow, fontName: .nunitoBold, size: 16)
        button.addTarget(self, action: #selector(createBuilding), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        formTextViews = [
            formTextViewClientName,
            formTextViewResponsableName,
            formTextViewAddress,
            formTextViewDateInit,
            formTextViewDateDelivery
        ]
    }
    
    func setupView(delegate: BuildingCreateDelegate) {
        self.delegate = delegate
        initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func createBuilding() {
        delegate?.createBuilding()
    }
    
    func addViews() {
        addSubview(stackView)
        addSubview(buttonAdd)
        
        formTextViews.forEach { formTextView in
            formTextView.setupView(title: "Titulo", placeholder: "Valor")
            stackView.addArrangedSubview(formTextView)
        }
    }
    
    func addConstraints() {
        buttonAdd.heightAnchor.constraint(equalToConstant: 48).isActive = true
        buttonAdd.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        buttonAdd.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        buttonAdd.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        
        stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -100).isActive = true
    }
}
