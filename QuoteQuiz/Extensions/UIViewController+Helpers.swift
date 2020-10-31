//
//  UIViewController+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit

extension UIViewController {
    
    func topMostViewController() -> UIViewController {
        guard let presentedController = presentedViewController else {
            return self
        }
        
        if let navigationController = presentedController as? UINavigationController, let visibleController = navigationController.visibleViewController {
            return visibleController.topMostViewController()
        }
        
        guard let tab = presentedController as? UITabBarController else {
            return presentedController.topMostViewController()
        }
        
        if let selectedTab = tab.selectedViewController {
            return selectedTab.topMostViewController()
        }
        
        return tab.topMostViewController()
    }
}
