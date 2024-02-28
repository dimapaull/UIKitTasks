// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора на стэк вью
final class StackViewController: UIViewController {
    // MARK: - Visual Components

    private let yellowView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .yellow
        return view
    }()

    private let redView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        return view
    }()

    private let greenView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .green
        return view
    }()

    private let blackView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()

    private lazy var stackView = {
        let stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .black
        stackView.frame = CGRect(x: 0, y: 0, width: 160, height: 376)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        view.addSubview(blackView)
        view.addSubview(stackView)
    }

    private func setupAnchors() {
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 350).isActive = true

        blackView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: stackView.centerYAnchor).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        blackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
        blackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -10).isActive = true
    }
}
