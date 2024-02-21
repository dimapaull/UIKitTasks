// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с профилем залогиненного пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    private enum Constants {
        static let myProfileName = "mary_rmLink"
    }

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUI()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white

        let lockBarItem = UIBarButtonItem(image: .lock, style: .plain, target: nil, action: nil)
        lockBarItem.tintColor = .black

        let userNameLabel = UILabel()
        userNameLabel.text = Constants.myProfileName
        userNameLabel.font = UIFont().verdanaBold(ofSize: 18)

        let userNameBarButtonItem = UIBarButtonItem(customView: userNameLabel)

        navigationItem.setLeftBarButtonItems([lockBarItem, userNameBarButtonItem], animated: true)

        let listButton = UIButton()
        listButton.setImage(.list, for: .normal)
        listButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let listBarItem = UIBarButtonItem(customView: listButton)

        let addButton = UIButton()
        addButton.setImage(.borderedAdd, for: .normal)
        addButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

        let listAddSpace = UIBarButtonItem(systemItem: .fixedSpace)
        listAddSpace.width = 3

        let addBarItem = UIBarButtonItem(customView: addButton)

        navigationItem.setRightBarButtonItems([listBarItem, listAddSpace, addBarItem], animated: true)
    }

    private func configureUI() {
        view.backgroundColor = .white
    }
}
