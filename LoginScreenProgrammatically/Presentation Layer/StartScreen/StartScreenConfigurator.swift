//
//  StartScreenConfigurator.swift
//  LoginScreenProgrammatically
//
//  Created by Zolt Varga on 02/06/22.
//

import UIKit

class StartScreenConfigurator {
    
    static func build() -> UIViewController {
        let view = StartView()
        let loginService = LoginService()
        let startViewController = StartViewController(startView: view,
                                                      loginService: loginService)
        let navigation = UINavigationController(rootViewController: startViewController)
        
        return navigation
    }
}
