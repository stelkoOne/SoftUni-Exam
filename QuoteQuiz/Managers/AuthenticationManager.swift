//
//  AuthenticationManager.swift
//  QuoteQuiz
//
//  Created by Stelio on 31.10.20.
//

import Foundation
import FirebaseAuth

final class AuthenticationManager {
    
    // MARK: - Singleton
    
    static let shared = AuthenticationManager()
    
    
    // MARK: - Variables
    
    private let delegatesHashTable: NSHashTable<AnyObject>
    
    
    // MARK: - Initializers
    
    init() {
        delegatesHashTable = NSHashTable<AnyObject>.weakObjects()
    }
    
    
    // MARK: - Public Methods
    
    func signIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            DispatchQueue.main.async {
                for delegate in self.delegates {
                    if let error = error {
                        delegate.signInFailed(withError: error)
                        continue
                    }
                    else {
                        delegate.didSignIn()
                    }
                }
            }
        }
    }
    
    func signUp(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            DispatchQueue.main.async {
                for delegate in self.delegates {
                    if let error = error {
                        delegate.signUpFailed(withError: error)
                        continue
                    }
                    else {
                        delegate.didSignUp()
                    }
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            for delegate in delegates {
                delegate.didSignOut()
            }
        }
        catch {
            for delegate in delegates {
                delegate.signOutFailed(withError: error)
            }
        }
    }
    
    func addDelegate(_ delegate: CommunicationDelegate) {
        delegatesHashTable.add(delegate)
    }
    
    func removeDelegate(_ delegate: CommunicationDelegate) {
        delegatesHashTable.remove(delegate)
    }
    
    
    // MARK: - Helpers
    
    private var delegates: [CommunicationDelegate] {
        if let delegates = delegatesHashTable.allObjects as? [CommunicationDelegate] {
            return delegates
        }
        
        return []
    }
}
