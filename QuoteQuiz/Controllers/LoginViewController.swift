//
//  LoginViewController.swift
//  QuoteQuiz
//
//  Created by Stelio on 27.10.20.
//

import UIKit
import BSKeyboardControls

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var usernameTextField: TextField!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    // MARK: - Variables
    
    private var keyboardControls = BSKeyboardControls()
    
    
    // MARK: - Status Bar Style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        keyboardControls.fields = [usernameTextField]
        keyboardControls.delegate = self
        usernameTextField.delegate = self
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViews() {
        view.layoutIfNeeded()
        
        gradientView.layer.insertSublayer(CAGradientLayer.gradientLayer(withFrame: self.gradientView.frame), at: 0)
        usernameTextField.placeholder = "Enter username"
        usernameTextField.returnKeyType = .next
        logoImageView.tintColor = .white
        logoImageView.image = #imageLiteral(resourceName: "musala-logo").withRenderingMode(.alwaysTemplate)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        keyboardControls.activeField = textField
    }
}

extension LoginViewController: BSKeyboardControlsDelegate {
    
    func keyboardControlsDonePressed(_ keyboardControls: BSKeyboardControls!) {
        keyboardControls.activeField.resignFirstResponder()
        keyboardControls.activeField = nil
    }
}
