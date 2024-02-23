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
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        notificationTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        notificationTextLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 7)
            .isActive = true
        notificationTextLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        notificationTextLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true

        postImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        postImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        postImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true

        likeButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
        likeButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 9).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 16).isActive = true

        replyButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor).isActive = true
        replyButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 10).isActive = true
        replyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        replyButton.heightAnchor.constraint(equalToConstant: 16).isActive = true
        replyButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
