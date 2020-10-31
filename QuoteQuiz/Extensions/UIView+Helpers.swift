//
//  UIView+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 30.10.20.
//

import UIKit

extension UIView {
    
    func roundCorners(_ radius: CGFloat? = nil) {
        layoutIfNeeded()
        var cornerRadius: CGFloat = frame.height / 2.0
        
        if let radius = radius {
            cornerRadius = radius
        }
        
        layer.cornerRadius = cornerRadius
    }
}
