//
//  UIColor+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 28.10.20.
//

import UIKit

extension UIColor {
    
    // MARK: - Convenience initializers
    
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
    }
    
    
    // MARK: - Public Methods
    
    static func withHex(_ hex: String) -> UIColor {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased().replacingOccurrences(of: "#", with: "")
        
        let redValue   = hexString.substring(from: 0, to: 2).hexToInt()
        let greenValue = hexString.substring(from: 2, to: 4).hexToInt()
        let blueValue  = hexString.substring(from: 4, to: 6).hexToInt()
        
        return UIColor(red: redValue.cgFloatValue,
                       green: greenValue.cgFloatValue,
                       blue: blueValue.cgFloatValue)
    }
    
    static var loginGradientStartColor: UIColor {
        return UIColor.withHex(Colors.loginGradientStartColor)
    }
    
    static var loginGradientEndColor: UIColor {
        return UIColor.withHex(Colors.loginGradientEndColor)
    }
}
