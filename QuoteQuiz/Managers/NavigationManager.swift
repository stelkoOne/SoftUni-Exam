//
//  NavigationManager.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit

final class NavigationManager {
    
    // Can we count this as a "Use segue" :P
    static func openMainViewController() {
        guard let topMostViewController = UIApplication.shared.topMostViewController else {
            print("UIApplication failed to get top-most view controller. \(#function)")
            return
        }
        
        guard let tabBarController = UIStoryboard.main.instantiateInitialViewController() as? UITabBarController else {
            print("Failed to intantiate controller that we want to present.")
            return
        }
        
        DispatchQueue.main.async {
            topMostViewController.present(tabBarController, animated: true, completion: nil)
        }
    }
}
