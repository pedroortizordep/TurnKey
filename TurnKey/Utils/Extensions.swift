//
//  Extensions.swift
//  TurnKey
//
//  Created by Pedro Del Rio Ortiz on 13/03/22.
//

import Foundation
import UIKit

extension ViewConfiguration {
    func initialize() {
        addViews()
        addConstraints()
    }
}

extension UIButton {
    func applyStyle(title: String, bgColor: UIColor, fontName: FontName, size: CGFloat) {
        setTitle(title, for: .normal)
        backgroundColor = bgColor
        titleLabel?.font = UIFont(name: fontName.rawValue, size: size)
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    func applyStyle(color: UIColor, fontName: FontName, size: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = color
        font = UIFont(name: fontName.rawValue, size: size)
    }
}

extension UITextField {
    func applyStyle(bgColor: UIColor, fontName: FontName, size: CGFloat) {
        font = UIFont(name: fontName.rawValue, size: size)
        backgroundColor = bgColor
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIColor {
    
    static let customBasicYellow = UIColor(hexString: "#FF9900")
    static let customBasicRed = UIColor(hexString: "#FF0000")
    static let customBasicGreen = UIColor(hexString: "#64CE33")
    
    static let customTextGray = UIColor(hexString: "#8B8B8B")
    static let customBackGroundGray = UIColor(hexString: "#F4F3F3")
    static let customButtonBackGroundGray = UIColor(hexString: "#CFCFCF")
    
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
