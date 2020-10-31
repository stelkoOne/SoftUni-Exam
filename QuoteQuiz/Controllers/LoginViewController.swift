//
//  LoginViewController.swift
//  QuoteQuiz
//
//  Created by Stelio on 27.10.20.
//

import UIKit
import FirebaseAuth
import IHKeyboardAvoiding

class LoginViewController: UIViewController {
    
    // MARK: - Enum
    
    private enum Screen {
        case username
        case password
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var credentialsScrollView: UIScrollView!
    
    
    // MARK: - Constants
    
    private let kUserDontExistErrorCode: Int = 17011
    
    
    // MARK: - Variables
    
    private var screen: Screen = .username
    
    
    // MARK: - Actions
    
    @IBAction private func next(_ sender: Any?) {
        switch screen {
        case .username: checkEmail()
        case .password: checkCredentials()
        }
    }
    
    
    // MARK: - Status Bar Style
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    
    // MARK: - Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        view.layoutIfNeeded()
        
        navigationItem.setHidesBackButton(true, animated: false)
        ThemeManager.setNavigationBarStyle(navigationController?.navigationBar, style: .login)
        KeyboardAvoiding.avoidingView = scrollView
        
        nextButton.roundCorners()
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.backgroundColor = .white
        
        gradientView.layer.insertSublayer(CAGradientLayer.gradientLayer(withFrame: gradientView.frame), at: 0)
        
        logoImageView.tintColor = UIColor.white.withAlphaComponent(0.75)
        logoImageView.image = #imageLiteral(resourceName: "softuni-logo-2").withRenderingMode(.alwaysTemplate)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        gradientView.layer.sublayers?.first?.frame = CGRect(origin: .zero, size: size)
        emailTextField.setNeedsDisplay()
        passwordTextField.setNeedsDisplay()
    }
    
    
    // MARK: - Private Methods
    
    private func checkEmail() {
        if emailTextField.isEmpty {
            let _ = emailTextField.becomeFirstResponder()
            return
        }
        
        goTo(screen: .password)
    }
    
    private func checkCredentials() {
        if passwordTextField.isEmpty {
            let _ = passwordTextField.becomeFirstResponder()
            return
        }
        
        if passwordTextField.safeText.count < 6 {
            UIAlertController.showAlert(fromController: self, message: "Password must be 6 chars minimum")
            return
        }
        
        // FIXME: Fix this shit.
        Auth.auth().signIn(withEmail: emailTextField.safeText,
                           password: passwordTextField.safeText) { (result, error) in
            if let error = error as NSError? {
                if error.code == self.kUserDontExistErrorCode {
            
                    Auth.auth().createUser(withEmail: self.emailTextField.safeText,
                                           password: self.passwordTextField.safeText) { (result, error) in
                        if let error = error {
                            UIAlertController.showAlert(fromController: self, message: error.localizedDescription)
                            return
                        }
                    }
                }
            }
            
            NavigationManager.openMainViewController()
            self.resetInput()
        }
    }
    
    private func goTo(screen: Screen) {
        self.screen = screen
        
        switch screen {
        case .username: let _ = emailTextField.becomeFirstResponder()
        case .password: let _ = passwordTextField.becomeFirstResponder()
        }
        
        let originX = screen == .username ? 0.0 : UIScreen.main.bounds.width
        credentialsScrollView.setContentOffset(CGPoint(x: originX, y: .zero), animated: true)
    }
    
    private func resetInput() {
        emailTextField.text = ""
        passwordTextField.text = ""
        goTo(screen: .username)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
