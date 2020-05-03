//  SceneDelegate.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties

    var window: UIWindow?
    
    private let coordinator = AppCoordinator()
    
    // MARK: - UIWindowSceneDelegate

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window = self.window
        
        coordinator.startFlow(in: window!)
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
}

