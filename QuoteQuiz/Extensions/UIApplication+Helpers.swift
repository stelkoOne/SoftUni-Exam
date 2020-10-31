//
//  UIApplication+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit

extension UIApplication {
    
    // MARK: - Public Methods
    
    var topMostViewController: UIViewController? {
        keyWindow?.rootViewController?.topMostViewController()
    }
}
