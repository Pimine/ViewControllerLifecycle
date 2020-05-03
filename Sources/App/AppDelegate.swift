//  AppDelegate.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit
import ScuffedUI
import GiphyUISDK
import GiphyCoreSDK
import IHKeyboardAvoiding

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: UIApplicationDelegate

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        Giphy.configure(apiKey: "Q8S9YCADjA6Eg7abLol4UWiHxb4r7uXN")
        ScuffedLayoutManager.primaryDesignResolution = CGSize(width: 375, height: 812)
        Appearance.configure()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) { }
}

