//  SearchController.swift
//  https://github.com/Pimine/ViewControllerLifecycle
//
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2020 Pimine

import UIKit
import ScuffedUI
import EasySwiftLayout
import IHKeyboardAvoiding

final class SearchController: UIViewController {
    
    // MARK: - Callbacks
    
    private let didEnterQuery: (String) -> Void
    
    // MARK: - User interface
    
    private let container = configure(VStack(spacing: 34.scaledByWidth)) {
        $0.horizontalMargin(34.scaledByWidth)
        $0.verticalMargin(100.scaledByWidth)
    }
    
    private let titleLabel = configure(UILabel()) {
        $0.font = Font.Quicksand.bold(size: 20)
        $0.text = "Let's find some"
        $0.textColor = Color.darkGray
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    private let searchContainer = configure(UIView()) {
        $0.addBorder(width: 1.scaledByWidth, color: Color.lightBlue)
        $0.cornerRadius = 8.scaledByWidth
        $0.backgroundColor = .white
        $0.height(45.scaledByWidth)
    }
    
    private lazy var searchTextField = configure(UISearchTextField()) {
        $0.placeholder = "Search"
        $0.returnKeyType = .search
        $0.textColor = Color.darkGray
        $0.font = Font.Quicksand.bold(size: 13)
        $0.borderStyle = .none
        $0.delegate = self
    }
    
    // MARK: - Initialization
    
    init(didEnterQuery: @escaping (String) -> Void) {
        self.didEnterQuery = didEnterQuery
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View controller lifecycle
    
    override func loadView() {
        view = KeyboardDismissingView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        addAndLayoutSubviews()
        KeyboardAvoiding.avoidingView = container
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - UITextFieldDelegate

extension SearchController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let query = textField.text, !query.isEmpty else { return false }
        view.endEditing(true)
        didEnterQuery(query)
        return true
    }
}

// MARK: - Layout and appearance configuration

extension SearchController {
    
    private func configureAppearance() {
        view.backgroundColor = Color.backgroundBlue
    }
    
    private func addAndLayoutSubviews() {
        view.addSubview(container)
        container.centerInSuperview(.y)
        container.pinEdgesToSuperview(ofGroup: .horizontal)
        
        container.addArrangedSubview(titleLabel)
        container.addArrangedSubview(searchContainer)
        
        searchContainer.addSubview(searchTextField)
        searchTextField.pinEdgesToSuperview(withInset: 14.scaledByWidth)
    }
}
