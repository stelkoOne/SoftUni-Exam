//
//  MoreViewController.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import UIKit
import FirebaseAuth

class MoreViewContoller: TabViewController {
    
    // MARK: - Actions
    
    @IBAction private func logOut(_ sender: Any) {
        AuthenticationManager.shared.signOut()
    }
}
