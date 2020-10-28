//
//  Constants.swift
//  QuoteQuiz
//
//  Created by Stelio on 28.10.20.
//

import UIKit

struct Constants {
    
    struct TextField {
        static let font: UIFont = .systemFont(ofSize: 16.5)
        
        struct Placeholder {
            static let color: UIColor = UIColor.white.withAlphaComponent(0.45)
            
        }
        struct Border {
            static let color: UIColor = UIColor.white.withAlphaComponent(0.45)
            static let height: CGFloat = 1.0
            static let style: UITextField.BorderStyle = .none
        }
        
        struct Font {
            static let color: UIColor = .white
        }
    }
}

struct Colors {
    static let loginGradientStartColor = "114D9E"
    static let loginGradientEndColor = "1E7EF6"
}


