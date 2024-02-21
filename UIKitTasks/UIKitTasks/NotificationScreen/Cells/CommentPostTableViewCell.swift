// CommentPostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейчка уведомления о посте
final class CommentPostTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let replyText = "Ответить"
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

    private let likeButton = {
        let button = UIButton()
        button.setImage(.likeIcon, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let replyButton = {
        let button = UIButton()
        button.setTitle(Constants.replyText, for: .normal)
        button.titleLabel?.font = UIFont().verdana(ofSize: 10)
        button.contentHorizontalAlignment = .left
        button.isHidden = true
        button.setTitleColor(.appGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let postImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(notification: Notification) {
        userImageView.image = UIImage(named: notification.avatarUserImageName)
        notificationTextLabel.setupLabelAttribute(
            fontSize: 12, name: notification.userName,
            title: notification.titleNotification,
            time: notification.timeNotification
        )
        postImageView.image = UIImage(named: notification.postImageName ?? "")
        if notification.isMention {
            likeButton.isHidden = false
            replyButton.isHidden = false
        }
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(userImageView)
        contentView.addSubview(notificationTextLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(replyButton)
    }

    private func setupAnchors() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            userImageView.heightAnchor.constraint(equalToConstant: 40),
            userImageView.widthAnchor.constraint(equalToConstant: 40),

            notificationTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 7),
            notificationTextLabel.heightAnchor.constraint(equalToConstant: 40),
            notificationTextLabel.widthAnchor.constraint(equalToConstant: 240),

            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            postImageView.heightAnchor.constraint(equalToConstant: 40),
            postImageView.widthAnchor.constraint(equalToConstant: 40),

            likeButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            likeButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 9),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 16),
            likeButton.widthAnchor.constraint(equalToConstant: 16),

            replyButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor),
            replyButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10),
            replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            replyButton.heightAnchor.constraint(equalToConstant: 16),
            replyButton.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
}
