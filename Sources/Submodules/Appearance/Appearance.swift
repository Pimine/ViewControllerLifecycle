//  Appearance.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit

final class Appearance {
    
    // MARK: - Public API
    
    static func configure() {
        configureNavigationBarAppearance()
    }
    
    // MARK: - Private API
    
    private static func configureNavigationBarAppearance() {
        let standard = UINavigationBarAppearance()
        standard.configureWithDefaultBackground()
        
        standard.backgroundColor = Color.blue
        standard.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: Font.Quicksand.bold(size: 16)
        ]
        
        let button = UIBarButtonItemAppearance(style: .plain)
        button.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: Font.Quicksand.bold(size: 16)
        ]
        standard.buttonAppearance = button
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = standard
    }
}
