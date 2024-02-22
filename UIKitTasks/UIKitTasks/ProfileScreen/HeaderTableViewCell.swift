// HeaderTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка основного профиль
final class HeaderTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let myProfileText = "Мария Иванова"
        static let profileDesctiptionText = "Консультат"
        static let linkText = "📎www.spacex.com"
        static let plusSymbol = "+"
        static let editText = "Изменить"
        static let shareText = "Поделиться профилем"
        static let cornerRadiusAddButton = 13.0
    }

    // MARK: - Visual Components

    private let myProfileImageView = {
        let imageView = UIImageView(image: .myProfile)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let addProfileButton = {
        let button = UIButton()
        button.setTitle(Constants.plusSymbol, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appPink
        button.layer.cornerRadius = Constants.cornerRadiusAddButton
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let myProfileLabel = {
        let label = UILabel()
        label.text = Constants.myProfileText
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let profileDesctiptionLabel = {
        let label = UILabel()
        label.text = Constants.profileDesctiptionText
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont().verdana(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let linkButton = {
        let button = UIButton()
        button.setTitle(Constants.linkText, for: .normal)
        button.titleLabel?.font = UIFont().verdana(ofSize: 14)
        button.setTitleColor(.appBlue, for: .normal)
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let editButton = {
        let button = UIButton()
        button.setTitle(Constants.editText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont().verdanaBold(ofSize: 10)
        button.backgroundColor = .appSoftGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareButton = {
        let button = UIButton()
        button.setTitle(Constants.shareText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont().verdanaBold(ofSize: 10)
        button.backgroundColor = .appSoftGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let addNewContactButton = {
        let button = UIButton()
        button.setImage(.addNewContact, for: .normal)
        button.backgroundColor = .appSoftGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let profileInformations = [("\nпубликации", 67), ("\nподписчики", 458), ("\nподписки", 120)]

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

    // MARK: - Private Methods

    private func configureUI() {
        addSubviews()
        setupImageViewsAnchors()
        setupButtonsAnchors()
        setupActionButtonsAnchors()
        setupLabelsAnchors()
        createProfileInformationLabels()
    }

    private func addSubviews() {
        for item in [
            myProfileImageView,
            addProfileButton,
            myProfileLabel,
            profileDesctiptionLabel,
            linkButton,
            editButton,
            shareButton,
            addNewContactButton
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
    }

    private func setupImageViewsAnchors() {
        myProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        myProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        myProfileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        myProfileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupButtonsAnchors() {
        addProfileButton.trailingAnchor.constraint(equalTo: myProfileImageView.trailingAnchor).isActive = true
        addProfileButton.bottomAnchor.constraint(equalTo: myProfileImageView.bottomAnchor).isActive = true
        addProfileButton.heightAnchor.constraint(equalToConstant: 26).isActive = true
        addProfileButton.widthAnchor.constraint(equalToConstant: 26).isActive = true

        linkButton.topAnchor.constraint(equalTo: profileDesctiptionLabel.bottomAnchor, constant: 6).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        linkButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        linkButton.widthAnchor.constraint(equalToConstant: 298).isActive = true
    }

    private func setupActionButtonsAnchors() {
        editButton.topAnchor.constraint(equalTo: linkButton.bottomAnchor, constant: 15).isActive = true
        editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        editButton.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -5).isActive = true

        shareButton.centerYAnchor.constraint(equalTo: editButton.centerYAnchor).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: editButton.trailingAnchor, constant: 10).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        shareButton.trailingAnchor.constraint(equalTo: addNewContactButton.leadingAnchor, constant: -5).isActive = true

        addNewContactButton.centerYAnchor.constraint(equalTo: shareButton.centerYAnchor).isActive = true
        addNewContactButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: -5).isActive = true
        addNewContactButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        addNewContactButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        addNewContactButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
            .isActive = true
    }

    private func setupLabelsAnchors() {
        myProfileLabel.topAnchor.constraint(equalTo: myProfileImageView.bottomAnchor, constant: 9).isActive = true
        myProfileLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        myProfileLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        myProfileLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true

        profileDesctiptionLabel.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor, constant: 11).isActive = true
        profileDesctiptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15)
            .isActive = true
        profileDesctiptionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        profileDesctiptionLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
    }

    private func createProfileInformationLabels() {
        var startX = 46.0
        for information in profileInformations {
            let countLabel = UILabel()
            countLabel.numberOfLines = 2
            countLabel.textAlignment = .center
            countLabel.setupInfoLabelAttribute(title: "\(information.1)", descripton: information.0)
            countLabel.translatesAutoresizingMaskIntoConstraints = false

            contentView.addSubview(countLabel)

            countLabel.topAnchor.constraint(equalTo: myProfileImageView.topAnchor, constant: 10).isActive = true
            countLabel.leadingAnchor.constraint(equalTo: myProfileImageView.trailingAnchor, constant: startX)
                .isActive = true
            countLabel.heightAnchor.constraint(equalToConstant: 31).isActive = true
            countLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
            startX += 70
        }
    }
}
