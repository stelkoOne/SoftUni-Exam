//
//  UIAlertController+Helpers.swift
//  QuoteQuiz
//
//  Created by Stelio on 30.10.20.
//

import UIKit

extension UIAlertController {
    
    // MARK: - Aliases
    
    typealias DefaultHandlerBlock = () -> Void
    
    
    // MARK: - Public Methods
    
    static func showAlert(fromController sender: UIViewController, withTitle title: String = Constants.appName, message: String, handlerBlock: DefaultHandlerBlock? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = self.alertAction(title: "OK", style: .default, handler: handlerBlock)
        
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            sender.present(alertController, animated: true, completion: nil)
        }
    }
    
    private static func alertAction(title: String, style: UIAlertAction.Style, handler: DefaultHandlerBlock?) ->  UIAlertAction {
        return UIAlertAction(title: title, style: style) { _ in
            handler?()
        }
    }
}
