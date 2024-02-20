// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер в котором представлена лента уведомлений
final class NotificationViewController: UIViewController {
        
    // MARK: - Constants
    private enum Constants {
        static let controllerTitle = "Уведомления"
    }
    
    // MARK: - Visual Components
    
    // MARK: - Public Properties
    
    // MARK: - Private Properties
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    // MARK: - Public Methods
    
    
    // MARK: - Private Methods
    
    private func setupNavigationBar() {
        title = Constants.controllerTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }
   
}
