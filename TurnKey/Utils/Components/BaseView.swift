//
//  BaseView.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 22/05/22.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    lazy var viewGenericError: ErrorView = {
        let view = ErrorView()
        view.backgroundColor = .white
        view.layer.zPosition = 2
        view.layer.cornerRadius = 16
        view.isHidden = true
        return view
    }()
    
    private var visualEffectView: UIVisualEffectView?
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showGenericError(image: UIImage = UIImage(named: "Warning") ?? UIImage(), title: String = "Oops!", message: String = "Um erro inesperado ocorreu\nTente novamente mais tarde") {
        
        createBlur()
        
        guard let window = UIApplication.shared.windows.last else { return }
        guard let visualEffectView = visualEffectView else { return }

        window.addSubview(visualEffectView)
        window.addSubview(viewGenericError)
        
        viewGenericError.centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true
        viewGenericError.centerYAnchor.constraint(equalTo: window.centerYAnchor).isActive = true
        viewGenericError.widthAnchor.constraint(equalTo: window.widthAnchor, multiplier: 0.8).isActive = true
        viewGenericError.heightAnchor.constraint(equalTo: window.heightAnchor, multiplier: 0.5).isActive = true
        
        viewGenericError.initialize()
        
        viewGenericError.setupView(image: image, title: title, message: message)
        viewGenericError.isHidden = false
    }
    
    private func createBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = UIScreen.main.bounds
        visualEffectView.layer.zPosition = 1
        self.visualEffectView = visualEffectView
    }
    
}
