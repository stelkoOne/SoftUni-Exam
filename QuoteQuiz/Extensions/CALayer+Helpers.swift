//
//  CALayer+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 27.10.20.
//

import UIKit

extension CAGradientLayer {
    
    static func gradientLayer(withFrame frame: CGRect) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = frame
        
        layer.colors = [UIColor.loginGradientStartColor.cgColor,
                        UIColor.loginGradientEndColor.cgColor]
        
        return layer
    }
}
