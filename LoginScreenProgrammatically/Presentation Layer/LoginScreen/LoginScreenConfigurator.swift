//
//  LoginScreenConfigurator.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import UIKit

class LoginScreenConfigurator {
    
    static func build() -> UIViewController {
        let view = LoginView()
        let loginService = LoginService()
        let loginViewController = LoginViewController(loginView: view,
                                                      loginService: loginService)
        let navigation = UINavigationController(rootViewController: loginViewController)
        
        return navigation
    }
}
