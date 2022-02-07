//
//  LoginView.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import Foundation

import UIKit

final class LoginView: UIView {
    
    // MARK: - Holder UI
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        // This is just for easier developement, way to color the stackview
//        let subView = UIView(frame: .zero)
//        subView.backgroundColor = .systemTeal
//        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        stackView.insertSubview(subView, at: 0)
        
        return stackView
    }()
    
    // MARK: - Holder UI
    
    lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .green
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .orange
        textField.isSecureTextEntry = true
        
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var ativityIndicator: UIActivityIndicatorView = {
        let ativityIndicator = UIActivityIndicatorView(style: .large)
        ativityIndicator.translatesAutoresizingMaskIntoConstraints = false
        ativityIndicator.backgroundColor = .purple
        return ativityIndicator
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupUI()
        styleUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // 1. view background
        backgroundColor = .red
        
        let elementWidth: CGFloat = 200
        let elementHeight: CGFloat = 50
        
        usernameTextField.heightAnchor.constraint(equalToConstant: elementHeight).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: elementWidth).isActive = true
        
        passwordTextField.heightAnchor.constraint(equalToConstant: elementHeight).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: elementWidth).isActive = true
        
        loginButton.heightAnchor.constraint(equalToConstant: elementHeight).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: elementWidth).isActive = true
        
        // StackView
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalTo: widthAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
    }
    
    func styleUI() {
        backgroundColor = .lightGray
        usernameTextField.backgroundColor = .gray
        passwordTextField.backgroundColor = .gray
    }
    
    // MARK: - Actions
    func startActivityIndicator() {
        addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(ativityIndicator)
        ativityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ativityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        ativityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        ativityIndicator.stopAnimating()
        ativityIndicator.removeFromSuperview()
        backgroundView.removeFromSuperview()
    }
}
