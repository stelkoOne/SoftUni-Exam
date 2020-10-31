//
//  NavigationManager.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit

final class NavigationManager {
    
    static func openMainViewController() {
        guard let topMostViewController = UIApplication.shared.topMostViewController else {
            print("UIApplication failed to get top-most view controller. \(#function)")
            return
        }
        
        guard let controllerToPresent = UIStoryboard.main.instantiateInitialViewController() else {
            print("Failed to intantiate controller that we want to present.")
            return
        }
        
        DispatchQueue.main.async {
            topMostViewController.present(controllerToPresent, animated: true, completion: nil)
        }
    }
}
