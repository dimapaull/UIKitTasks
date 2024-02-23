// SubscribeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейки подписки
final class SubscribeTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let subscribeText = "Подписаться"
        static let youSubscribeText = "Вы подписаны"
    }

    // MARK: - Visual Components

    private let userImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let notificationTextLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont().verdana(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subscribeButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appBlue
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        button.titleLabel?.font = UIFont().verdanaBold(ofSize: 10)
        button.addTarget(self, action: #selector(subscridePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(notification: Notification) {
        userImageView.image = UIImage(named: notification.avatarUserImageName)
        notificationTextLabel.setupLabelAttribute(
            fontSize: 12, title: notification.userName,
            descripton: notification.titleNotification,
            additionalText: notification.timeNotification
        )
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(notificationTextLabel)
        contentView.addSubview(subscribeButton)
    }

    private func setupAnchors() {
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        notificationTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 7)
            .isActive = true
        notificationTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        notificationTextLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true

        subscribeButton.centerYAnchor.constraint(equalTo: notificationTextLabel.centerYAnchor).isActive = true
        subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
            .isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 115).isActive = true
    }

    @objc private func subscridePressed(_ button: UIButton) {
        if button.backgroundColor == .appBlue {
            button.setTitle(Constants.youSubscribeText, for: .normal)
            button.setTitleColor(.appGray, for: .normal)
            button.backgroundColor = .white
            button.layer.borderColor = UIColor.appGray.cgColor
        } else {
            button.setTitle(Constants.subscribeText, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .appBlue
            button.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
