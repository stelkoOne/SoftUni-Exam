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
    
    
    // MARK: - Variables
    
    private var screen: Screen = .username
    
    
    // MARK: - Actions
    
    @IBAction private func next(_ sender: Any?) {
        switch screen {
        case .username: checkEmail()
        case .password: checkCredentials()
        }
    }
    
    @objc private func goBack(_ sender: Any) {
        goTo(screen: .username)
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AuthenticationManager.shared.addDelegate(self)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        gradientView.layer.sublayers?.first?.frame = CGRect(origin: .zero, size: size)
        emailTextField.setNeedsDisplay()
        passwordTextField.setNeedsDisplay()
    }
    
    
    // MARK: - Private Methods
    
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
    
    private func checkEmail() {
        if emailTextField.isEmpty {
            let _ = emailTextField.becomeFirstResponder()
            return
        }
        
        if !emailTextField.safeText.isValidEmail {
            UIAlertController.showAlert(fromController: self, message: "Please enter valid e-mail address.")
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
            UIAlertController.showAlert(fromController: self, message: "Password must be at least 6 characters long.") {
                self.passwordTextField.text = ""
                let _ = self.passwordTextField.becomeFirstResponder()
            }
            return
        }
        
        AuthenticationManager.shared.signIn(withEmail: emailTextField.safeText,
                                            password: passwordTextField.safeText)
    }
    
    private func goTo(screen: Screen) {
        self.screen = screen
        
        let _ = screen == .username ? emailTextField.becomeFirstResponder()
                                    : passwordTextField.becomeFirstResponder()
        
        let originX = screen == .username ? 0.0 : UIScreen.main.bounds.width
        
        navigationItem.setLeftBarButton(backButton, animated: true)
        credentialsScrollView.setContentOffset(CGPoint(x: originX, y: .zero), animated: true)
    }
    
    private func resetInput() {
        emailTextField.text = ""
        passwordTextField.text = ""
        goTo(screen: .username)
    }
    
    
    // MARK: - Helpers
    
    private var backButton: UIBarButtonItem? {
        if screen == .username {
            return nil
        }
        
        return UIBarButtonItem(image: #imageLiteral(resourceName: "left-arrow").withRenderingMode(.alwaysTemplate),
                               style: .plain,
                               target: self,
                               action: #selector(goBack(_:)))
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

extension LoginViewController: CommunicationDelegate {
    
    func didSignIn() {
        NavigationManager.openMainViewController()
    }
    
    func signInFailed(withError error: Error) {
        if let error = error as NSError?, error.code == AuthErrorCode.userNotFound.rawValue {
            AuthenticationManager.shared.signUp(withEmail: emailTextField.safeText,
                                                password: passwordTextField.safeText)
            return
        }
        
        UIAlertController.showAlert(fromController: self, message: error.localizedDescription) {
            self.resetInput()
        }
    }
    
    func didSignUp() {
        NavigationManager.openMainViewController()
    }
    
    func signUpFailed(withError error: Error) {
        UIAlertController.showAlert(fromController: self, message: error.localizedDescription) {
            self.resetInput()
        }
    }
    
    func didSignOut() {
        resetInput()
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
