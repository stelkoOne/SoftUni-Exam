//
//  Constants.swift
//  QuoteQuiz
//
//  Created by Stelio on 28.10.20.
//

import UIKit

struct Constants {
    
    static let appName: String = "QuoteQuiz"
    
    struct NavigationBar {
        
        enum Style {
            case login
            case `default`
            
            var isDefault: Bool {
                self == .default
            }
        }
        
        static let font: UIFont = .systemFont(ofSize: 17.0, weight: .semibold)
        static let fontColor: UIColor = .white
    }
    
    struct TextField {
        static let font: UIFont = .systemFont(ofSize: 16.5)
        
        struct Placeholder {
            static let color: UIColor = UIColor.white.withAlphaComponent(0.45)
            static let font: UIFont = .systemFont(ofSize: 14.0)
            
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


struct Storyboards {
    static let main: String = "Main"
}

struct Regex {
    static let email: String = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
}
