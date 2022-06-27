//
//  NotFoundErrorView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 28/03/22.
//

import Foundation
import UIKit

class NotFoundErrorView: UIView, ViewConfiguration {
    
    private lazy var imageViewNotFound: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Not Found")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelError: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.applyStyle(color: .customTextGray, fontName: .nunitoBold, size: 17)
        return label
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
    
    func setupView(color: UIColor, message: String) {
        imageViewNotFound.tintColor = color
        labelError.text = message
        
        initialize()
    }
    
    func addViews() {
        addSubview(imageViewNotFound)
        addSubview(labelError)
    }
    
    func addConstraints() {
        imageViewNotFound.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageViewNotFound.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 8).isActive = true
        imageViewNotFound.widthAnchor.constraint(equalToConstant: 116).isActive = true
        imageViewNotFound.heightAnchor.constraint(equalToConstant: 116).isActive = true
        
        labelError.centerXAnchor.constraint(equalTo: imageViewNotFound.centerXAnchor).isActive = true
        labelError.topAnchor.constraint(equalTo: imageViewNotFound.bottomAnchor, constant: 12).isActive = true
    }
}
