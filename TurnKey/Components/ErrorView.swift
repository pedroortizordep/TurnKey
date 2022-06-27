//
//  ErrorView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 29/03/22.
//

import Foundation
import UIKit

class ErrorView: UIView, ViewConfiguration {
    
    private lazy var imageViewError: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "atrasada")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelErrorTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.applyStyle(color: .customTextGray, fontName: .nunitoBold, size: 17)
        return label
    }()
    
    private lazy var labelErrorMessage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.applyStyle(color: .customTextGray, fontName: .nunitoBold, size: 17)
        return label
    }()
    
    lazy var buttonTryAgain: UIButton = {
        let button = UIButton()
        button.applyStyle(title: "Tentar Novamente", bgColor: .customBasicYellow, fontName: .nunitoBold, size: 16)
        button.addTarget(self, action: #selector(tryAgain), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.applyStyle(title: "Cancelar", bgColor: .clear, textColor: .customBasicYellow, fontName: .nunitoBold, size: 16)
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(image: UIImage, title: String, message: String) {
        imageViewError.image = image
        labelErrorTitle.text = title
        labelErrorMessage.text = message
    }
    
    @objc func tryAgain() {
        
    }
    
    @objc func cancel() {
        
    }
    
    func addViews() {
        addSubview(imageViewError)
        addSubview(labelErrorTitle)
        addSubview(labelErrorMessage)
        addSubview(buttonTryAgain)
        addSubview(buttonCancel)
    }
    
    func addConstraints() {
        imageViewError.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageViewError.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        imageViewError.widthAnchor.constraint(equalToConstant: 116).isActive = true
        imageViewError.heightAnchor.constraint(equalToConstant: 116).isActive = true
        
        labelErrorTitle.centerXAnchor.constraint(equalTo: imageViewError.centerXAnchor).isActive = true
        labelErrorTitle.topAnchor.constraint(equalTo: imageViewError.bottomAnchor, constant: 12).isActive = true
        
        labelErrorMessage.centerXAnchor.constraint(equalTo: imageViewError.centerXAnchor).isActive = true
        labelErrorMessage.topAnchor.constraint(equalTo: labelErrorTitle.bottomAnchor, constant: 24).isActive = true
        
        buttonTryAgain.topAnchor.constraint(equalTo: labelErrorMessage.bottomAnchor, constant: 24).isActive = true
        buttonTryAgain.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        buttonTryAgain.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        buttonTryAgain.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        buttonCancel.topAnchor.constraint(equalTo: buttonTryAgain.bottomAnchor, constant: 8).isActive = true
        buttonCancel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        buttonCancel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        buttonCancel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
