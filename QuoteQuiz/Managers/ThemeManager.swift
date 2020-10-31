//
//  ThemeManager.swift
//  QuoteQuiz
//
//  Created by Stelio on 30.10.20.
//

import UIKit

final class ThemeManager {
    
    // MARK: - Navigation Bar
    
    static func setNavigationBarStyle(_ navigationBar: UINavigationBar?, style: Constants.NavigationBar.Style) {
        guard let navigationBar = navigationBar else {
            return
        }
        
        let titleAttributes: [NSAttributedString.Key : Any] = [
            .font : Constants.NavigationBar.font,
            .foregroundColor : Constants.NavigationBar.fontColor
        ]
        
        navigationBar.isTranslucent = style.isDefault ? true : false
        navigationBar.shadowImage = style.isDefault ? nil : UIImage()
        navigationBar.barTintColor = style.isDefault ? nil : .loginGradientStartColor
        navigationBar.tintColor = style.isDefault ? nil : .white
        navigationBar.titleTextAttributes = style.isDefault ? nil : titleAttributes
        navigationBar.barStyle = style.isDefault ? .default : .black
    }
}
