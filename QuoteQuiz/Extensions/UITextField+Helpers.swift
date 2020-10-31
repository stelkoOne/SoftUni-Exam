//
//  UITextField+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 30.10.20.
//

import UIKit

extension UITextField {
    
    // MARK: - Public Methods
    
    var safeText: String {
        text ?? ""
    }
    
    var isEmpty: Bool {
        safeText == ""
    }
    
}
