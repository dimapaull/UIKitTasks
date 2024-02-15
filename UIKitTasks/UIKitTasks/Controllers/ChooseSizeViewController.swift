// ChooseSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер предоставляющий выбор размера для пользователя
final class ChooseSizeViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let controllerTitle = "Выберите размер"
        static let sizeRegion = "EU"
        static let startY: CGFloat = 77
    }

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private let sizes = Array(35 ... 39)

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        createSizeButtons()
    }

    private func configureNavigationBar() {
        navigationItem.title = Constants.controllerTitle

        let closeBarItem = UIBarButtonItem(
            image: .closeCross,
            style: .plain,
            target: self,
            action: #selector(didClosePressed)
        )
        closeBarItem.tintColor = .black

        navigationItem.leftBarButtonItem = closeBarItem
    }

    private func createSizeButtons() {
        var startY = Constants.startY
        for size in sizes {
            let sizeButton = UIButton()
            sizeButton.setTitle("\(size) \(Constants.sizeRegion)", for: .normal)
            sizeButton.titleLabel?.font = .systemFont(ofSize: 16)
            sizeButton.setTitleColor(.black, for: .normal)
            sizeButton.titleLabel?.textAlignment = .left
            sizeButton.translatesAutoresizingMaskIntoConstraints = false

            let lineView = UIView()
            lineView.layer.borderColor = UIColor.lightGray.cgColor
            lineView.layer.borderWidth = 0.3
            lineView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(sizeButton)
            view.addSubview(lineView)

            NSLayoutConstraint.activate([
                sizeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
                sizeButton.heightAnchor.constraint(equalToConstant: 19),
                sizeButton.widthAnchor.constraint(equalToConstant: 60),
                sizeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: startY),

                lineView.widthAnchor.constraint(equalToConstant: 335),
                lineView.heightAnchor.constraint(equalToConstant: 1),
                lineView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lineView.topAnchor.constraint(equalTo: sizeButton.bottomAnchor, constant: 7),
            ])

            startY += 37
        }
    }

    @objc private func didClosePressed() {
        dismiss(animated: true)
    }
}
