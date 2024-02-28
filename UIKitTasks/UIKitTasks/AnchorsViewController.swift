// AnchorsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со светофором на якорях
final class AnchorsViewController: UIViewController {
    // MARK: - Visual Components

    private let yellowView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    private let redView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let greenView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private let blackView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        for item in [blackView, yellowView, redView, greenView] {
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)
        }
    }

    private func setupAnchors() {
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 130).isActive = true
        let heightConstraint = yellowView.heightAnchor.constraint(
            equalTo: view.heightAnchor,
            multiplier: 0.25
        )
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true

        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -15).isActive = true
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true

        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 15).isActive = true
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true

        blackView.widthAnchor.constraint(equalTo: yellowView.widthAnchor, constant: 30).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15).isActive = true
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -15).isActive = true
        blackView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
    }
}
