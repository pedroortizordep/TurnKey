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
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var formTextViewBuildingNickname = FormTextView(title: "Obra", placeholder: "Apelido")
    lazy var formTextViewClientName = FormTextView(title: "Cliente", placeholder: "Cliente")
    lazy var formTextViewResponsableName = FormTextView(title: "Encarregado TurnKey", placeholder: "Encarregado")
    lazy var formTextViewArchtect = FormTextView(title: "Arquiteto", placeholder: "Arquiteto")
    lazy var formTextViewAddress = FormTextView(title: "Endereço", placeholder: "Endereço")
    lazy var formTextViewDateInit = FormTextView(title: "Data Início", placeholder: "dd/mm/yyyy")
    lazy var formTextViewDateDelivery = FormTextView(title: "Data Entrega", placeholder: "dd/mm/yyyy")
    
    var formTextViews: [FormTextView] = []
    
    weak var delegate: BuildingCreateDelegate?
    
    private lazy var viewOptions: FilterOptionView = {
        let view = FilterOptionView()
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelAmbients: UILabel = {
        let label = UILabel()
        label.text = "Ambientes"
        label.applyStyle(color: .black, fontName: .nunitoBold, size: 20)
        return label
    }()
    
    lazy var tableViewAmbients: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(AmbientCell.self, forCellReuseIdentifier: "ambientsCell")
        return tableView
    }()
    
    private lazy var labelNewAmbient: UILabel = {
        let label = UILabel()
        label.text = "Novo ambiente"
        label.applyStyle(color: .customBasicBlue, fontName: .nunitoBold, size: 14)
        return label
    }()
    
    lazy var buttonAddAmbient: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Location"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
            formTextViewBuildingNickname,
            formTextViewClientName,
            formTextViewResponsableName,
            formTextViewArchtect,
            formTextViewAddress,
            formTextViewDateInit,
            formTextViewDateDelivery
        ]
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(tableDelegate: UITableViewDelegate, dataSource: UITableViewDataSource, status: [BuildingStatus], delegate: BuildingCreateDelegate, filterDelegate: OptionFilterDelegate) {
        
        self.delegate = delegate
        self.tableViewAmbients.delegate = tableDelegate
        self.tableViewAmbients.dataSource = dataSource
        
        var options: [String] = []
        
        status.forEach { activity in
            options.append(activity.rawValue)
        }
        
        viewOptions.configure(options: options, delegate: filterDelegate)
        
        initialize()
    }
    
    @objc func createBuilding() {
        delegate?.createBuilding()
    }
    
    func addViews() {
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        formTextViews.forEach { formTextView in
            stackView.addArrangedSubview(formTextView)
        }
        
        scrollView.addSubview(viewOptions)
        scrollView.addSubview(labelAmbients)
        scrollView.addSubview(tableViewAmbients)
        scrollView.addSubview(labelNewAmbient)
        scrollView.addSubview(buttonAddAmbient)
        scrollView.addSubview(buttonAdd)
    }
    
    func addConstraints() {
        let safeG = safeAreaLayoutGuide
        let contentG = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeG.topAnchor, constant: 8.0),
            scrollView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 8.0),
            scrollView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -8.0),
            scrollView.bottomAnchor.constraint(equalTo: safeG.bottomAnchor, constant: -8.0),
            
            stackView.topAnchor.constraint(equalTo: contentG.topAnchor, constant: 48),
            stackView.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 500),
            
            viewOptions.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32),
            viewOptions.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            viewOptions.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            viewOptions.heightAnchor.constraint(equalToConstant: 64),
            
            labelAmbients.topAnchor.constraint(equalTo: viewOptions.bottomAnchor, constant: 48),
            labelAmbients.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 24),
            labelAmbients.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            
            tableViewAmbients.topAnchor.constraint(equalTo: labelAmbients.bottomAnchor, constant: 12),
            tableViewAmbients.leadingAnchor.constraint(equalTo: safeG.leadingAnchor),
            tableViewAmbients.trailingAnchor.constraint(equalTo: safeG.trailingAnchor),
            tableViewAmbients.heightAnchor.constraint(equalToConstant: 130),
            
            labelNewAmbient.topAnchor.constraint(equalTo: tableViewAmbients.bottomAnchor, constant: 14),
            labelNewAmbient.leadingAnchor.constraint(equalTo: safeG.leadingAnchor, constant: 32),
            
            buttonAddAmbient.centerYAnchor.constraint(equalTo: labelNewAmbient.centerYAnchor),
            buttonAddAmbient.trailingAnchor.constraint(equalTo: safeG.trailingAnchor, constant: -24),
            buttonAddAmbient.heightAnchor.constraint(equalToConstant: 24),
            buttonAddAmbient.widthAnchor.constraint(equalToConstant: 24),
            
            buttonAdd.topAnchor.constraint(equalTo: labelNewAmbient.bottomAnchor, constant: 60),
            buttonAdd.heightAnchor.constraint(equalToConstant: 48),
            buttonAdd.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            buttonAdd.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            buttonAdd.bottomAnchor.constraint(equalTo: contentG.bottomAnchor, constant: -16)
        ])
    }
}
