//
//  CommunicationDelegate.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import Foundation

protocol CommunicationDelegate: class {
    
    func didSignIn()
    func signInFailed(withError error: Error)
    
    func didSignUp()
    func signUpFailed(withError error: Error)
    
    func didSignOut()
    func signOutFailed(withError error: Error)
}

extension CommunicationDelegate {
    
    func didSignIn() { }
    func signInFailed(withError error: Error) { }
    
    func didSignUp() { }
    func signUpFailed(withError error: Error) { }
    
    func didSignOut() { }
    func signOutFailed(withError error: Error) { }

}
