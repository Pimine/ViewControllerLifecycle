//  Font.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit

struct Font {
    
    struct Quicksand {
        
        static func bold(size: CGFloat) -> UIFont {
            UIFont(name: "Quicksand-Bold", size: size.scaledByWidth)!
        }
    }
}
