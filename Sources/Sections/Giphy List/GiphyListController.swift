//  GiphyListController.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit
import GiphyUISDK

final class GiphyListController: UIViewController {
    
    // MARK: - Properties
    
    private let searchQuery: String
    
    // MARK: - Child view controllers
    
    private let gridController = GiphyGridController()
    
    // MARK: - Initialization
    
    init(searchQuery: String) {
        self.searchQuery = searchQuery
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildControllers()
        configureAppearance()
        addAndLayoutSubviews()
        
        updateContent()
    }
    
    // MARK: - Private methods
    
    private func addChildControllers() {
        addChild(gridController)
        gridController.didMove(toParent: self)
    }
    
    private func updateContent() {
        gridController.content = GPHContent.search(withQuery: searchQuery, mediaType: .sticker, language: .english)
        gridController.update()
    }
}

// MARK: - Layout and appearance configuration

extension GiphyListController {
    
    private func configureAppearance() {
        title = "Search: \(searchQuery)"
        view.backgroundColor = Color.backgroundBlue
    }
    
    private func addAndLayoutSubviews() {
        view.addSubview(gridController.view)
        gridController.view.pinEdgeToSuperview(.bottom)
        gridController.view.pinEdgesToSuperview(excludingEdge: .bottom, respectingGuide: .safeAreaLayout)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
