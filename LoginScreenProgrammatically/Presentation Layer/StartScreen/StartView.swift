//
//  StartView.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import UIKit

final class StartView: UIView {
    
    // MARK: - UI
    
    lazy var ativityIndicator: UIActivityIndicatorView = {
        let ativityIndicator = UIActivityIndicatorView(style: .large)
        ativityIndicator.translatesAutoresizingMaskIntoConstraints = false
        ativityIndicator.backgroundColor = .red
        return ativityIndicator
    }()
    
    lazy var activityInfoTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.text = ""
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        return label
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
        backgroundColor = .yellow
        
        // 2. Ativity Indicator postion
        addSubview(ativityIndicator)
        ativityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ativityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // 3. Text
        addSubview(activityInfoTextLabel)
        activityInfoTextLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        activityInfoTextLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityInfoTextLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        activityInfoTextLabel.bottomAnchor.constraint(equalTo: ativityIndicator.topAnchor).isActive = true
    }
    
    func styleUI() {
        backgroundColor = .lightGray
        ativityIndicator.backgroundColor = .clear
        activityInfoTextLabel.backgroundColor = .gray
    }
    
    // MARK: - Actions
    
    func startAnimatingActivity() {
        ativityIndicator.startAnimating()
    }
    
    func stopAnimatingActivity() {
        ativityIndicator.stopAnimating()
    }
    
    func setActivityInfo(_ info: String) {
        activityInfoTextLabel.text = info
    }
}

