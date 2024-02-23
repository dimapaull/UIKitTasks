// RecommendView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class RecommendView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let subscribeText = "Подписаться"
    }

    // MARK: - Visual Components

    private let recommendImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 57.5
        return imageView
    }()

    private let deleteButton = {
        let buttcon = UIButton()
        buttcon.setImage(.delete, for: .normal)
        buttcon.tintColor = .black
        return buttcon
    }()

    private let subscribeButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = UIFont.verdanaBold(ofSize: 10)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appBlue
        button.layer.cornerRadius = 8
        return button
    }()

    private let userNameLabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.verdana(ofSize: 10)
        return label
    }()

    // MARK: - Initializers

    convenience init(recommend: Recommend) {
        self.init()
        addSubviews()
        recommendImageView.image = UIImage(named: recommend.userAvatarImageName)
        userNameLabel.text = recommend.userName
        setConstraintAvatarImageView()
        setConstraintNameLabel()
        setConstraintButtons()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        for view in [recommendImageView, deleteButton, subscribeButton, userNameLabel] {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }

    private func setConstraintAvatarImageView() {
        recommendImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
        recommendImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        recommendImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15)
            .isActive = true
        recommendImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setConstraintNameLabel() {
        userNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: recommendImageView.bottomAnchor, constant: 5)
            .isActive = true
        userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setConstraintButtons() {
        deleteButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 8.5).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.5)
            .isActive = true

        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14)
            .isActive = true
        subscribeButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
