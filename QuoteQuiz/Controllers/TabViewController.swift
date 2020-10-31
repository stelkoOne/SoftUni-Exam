//
//  TabViewController.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit

class TabViewController: UIViewController {
    
    
    // MARK: - Controller Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let delegate = self as? CommunicationDelegate {
            AuthenticationManager.shared.addDelegate(delegate)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let delegate = self as? CommunicationDelegate {
            AuthenticationManager.shared.removeDelegate(delegate)
        }
        
        super.viewWillDisappear(animated)
    }
}
