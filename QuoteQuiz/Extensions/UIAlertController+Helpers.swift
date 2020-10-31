//
//  UIAlertController+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 30.10.20.
//

import UIKit

extension UIAlertController {
    
    // MARK: - Public Methods
    
    static func showAlert(fromController sender: UIViewController, withTitle title: String = Constants.appName, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            sender.present(alertController, animated: true, completion: nil)
        }
    }
}
