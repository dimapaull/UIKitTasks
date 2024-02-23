// StoriesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для представления одной истории во весь экран
final class StoriesViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let nameOfStoryText = "Запуск"
        static let progressValue: Float = 0.5
    }

    // MARK: - Visual Components

    private let storyImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let miniStoryImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let closeButton = {
        let button = UIButton()
        button.setImage(.clear, for: .normal)
        return button
    }()

    private let storyProgressView = {
        let progressView = UIProgressView()
        progressView.progress = Constants.progressValue
        progressView.tintColor = .white
        return progressView
    }()

    private let nameOfStoryLabel = {
        let label = UILabel()
        label.text = Constants.nameOfStoryText
        label.textColor = .white
        label.font = UIFont().verdana(ofSize: 10)
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Public Methods

    func setupImage(mainImageName: UIImage) {
        storyImageView.image = mainImageName
        miniStoryImageView.image = mainImageName
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        view.addSubview(storyImageView)
        for item in [miniStoryImageView, closeButton, storyProgressView, nameOfStoryLabel] {
            item.translatesAutoresizingMaskIntoConstraints = false
            storyImageView.addSubview(item)
        }
    }

    private func setupAnchors() {
        storyImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -40).isActive = true
        storyImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40).isActive = true
        storyImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        storyImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 23).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true

        storyProgressView.topAnchor.constraint(equalTo: view.topAnchor, constant: 11).isActive = true
        storyProgressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        storyProgressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        storyProgressView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        miniStoryImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 21).isActive = true
        miniStoryImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        miniStoryImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        miniStoryImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        nameOfStoryLabel.centerYAnchor.constraint(equalTo: miniStoryImageView.centerYAnchor).isActive = true
        nameOfStoryLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
        nameOfStoryLabel.leadingAnchor.constraint(equalTo: miniStoryImageView.trailingAnchor, constant: 8)
            .isActive = true
        nameOfStoryLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}
