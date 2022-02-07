//
//  StartViewController.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/05/22.
//

import UIKit

final class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    private let infoText = ["0️⃣ Setup Security.",
                            "1️⃣ Loading Assets.",
                            "2️⃣ Fetching Data.",
                            "3️⃣ Mixing Colors."]
    
    private var loopCounter = 0
    private var timer: Timer?
    
    private let startView: StartView
    private let loginService: LoginService
    
    // MARK: - Init
    
    init(startView: StartView, loginService: LoginService) {
        self.startView = startView
        self.loginService = loginService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startView.startAnimatingActivity()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupInfoMessageLoop()
        
        loginService.isLogedIn({ isLogedIn in
            self.startView.stopAnimatingActivity()
            self.timer?.invalidate()
            
            self.routeToLoginScreen()
        })
    }
    
    // MARK: - Timer
    func setupInfoMessageLoop() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.7, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            let infoText = self.infoText[self.loopCounter]
            self.startView.setActivityInfo(infoText)
            
            self.loopCounter += 1
            if self.loopCounter == self.infoText.count {
                self.loopCounter = 0
            }
        }
        timer?.tolerance = 0.2
    }
}

// MARK: - Navigation / Router
extension StartViewController {
    func routeToLoginScreen() {
        let loginViewController = LoginScreenConfigurator.build()
        loginViewController.modalPresentationStyle = .fullScreen
        present(loginViewController, animated: true, completion: nil)
    }
}
