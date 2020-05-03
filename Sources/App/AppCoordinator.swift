//  AppCoordinator.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit
import ScuffedUI

final class AppCoordinator {
    
    // MARK: - Properties
    
    private var window: UIWindow!
    
    private let navigationController = NavigationController()
    
    // MARK: - Navigation
    
    func startFlow(in window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        openSearch()
    }
    
    private func openSearch() {
        let searchController = SearchController(didEnterQuery: openGiphyList)
        navigationController.setViewControllers([searchController], animated: false)
    }
    
    private func openGiphyList(searchQuery: String) {
        let listController = GiphyListController(searchQuery: searchQuery)
        navigationController.pushViewController(listController, animated: true)
    }
}
