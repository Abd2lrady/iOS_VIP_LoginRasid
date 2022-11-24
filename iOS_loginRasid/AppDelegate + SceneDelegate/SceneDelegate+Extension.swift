//
//  SceneDelegate+Extension.swift
//  iOS_loginRasid
//
//  Created by Fintech on 24/11/2022.
//

import UIKit

extension SceneDelegate {
    
    func bootApp(scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        let view = ViewController()
        let navigator = UINavigationController(rootViewController: view)
        window.rootViewController = navigator
        window.makeKeyAndVisible()
        self.window = window
    }
}
