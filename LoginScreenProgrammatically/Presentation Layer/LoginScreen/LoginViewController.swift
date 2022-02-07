//
//  ViewController.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/05/22.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let loginView: LoginView
    private let loginService: LoginService
    
    // MARK: - Init
    
    init(loginView: LoginView, loginService: LoginService) {
        self.loginView = loginView
        self.loginService = loginService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.loginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
    }
}

// MARK: - Action
private extension LoginViewController {
    @objc func tapLoginButton() {
        
        if let username = loginView.usernameTextField.text,
           let password = loginView.passwordTextField.text,
           loginService.validateUserName(username),
           loginService.validatePassword(password)
        {
            loginView.startActivityIndicator()
            loginService.logIn({ [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .success(let state):
                    self.loginView.stopActivityIndicator()
                    self.routeToCentralScreen()
                case .failure(let error):
                    print("Failed to log in present some message to the User. Error: \(error.localizedDescription)")
                }
            })
        } else {
            print("Wrong Username or Password")
        }
    }
}

// MARK: - Navigation / Router
extension LoginViewController {
    func routeToCentralScreen() {
        let centalViewController = CentralViewController()
        centalViewController.modalPresentationStyle = .fullScreen
        present(centalViewController, animated: true, completion: nil)
    }
}
