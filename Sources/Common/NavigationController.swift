//  NavigationController.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit

class NavigationController: UINavigationController {

    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
}
