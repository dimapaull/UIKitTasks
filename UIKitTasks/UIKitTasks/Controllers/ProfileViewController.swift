// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер с профилем пользователя
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let title = "Профиль"
        static let discount = "15%"
        static let discountCardNumber = "1000 0001 0102"
        static let menuTitle = "Личные данные"
        static let personalData = "Мои данные"
        static let inviteFriend = "Приведи друга"
        static let feedback = "Обратная связь"
        static let cardLabelColor = UIColor.white
        static let cardButtonBackgroundColor = UIColor(white: 1, alpha: 0.1)
        static let separatorColor = #colorLiteral(red: 0.9248393178, green: 0.9216213822, blue: 0.9215624928, alpha: 1)

        static let logoImageName = "logoCard"
        static let qrCodeImageName = "qrCodeCard"
        static let infoCardImageName = "infoCard"
        static let userInfoImageName = "uresDataIcon"
        static let inviteImageName = "likePerson"
        static let feedbackImageName = "reviewIcon"

        static let titleFont = "Verdana-Bold"
        static let regularFont = "Verdana"
        static let regularFontSize = CGFloat(16)
        static let smallFontSize = CGFloat(14)
    }

    // MARK: - Visual Components

    private let discountCardView = UIView()
    private let discountCardLogoImageView = UIImageView()
    private let discountLabel = UILabel()
    private let discountCardNumber = UILabel()
    private let menuTitle = UILabel()

    private let qrCodeButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(qrCodeButtonPressed), for: .touchUpInside)
        return button
    }()

    private let cardInfoButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(cardInfoButtonPressed), for: .touchUpInside)
        return button
    }()

    private let userInfoButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(userInfoButtonPressed), for: .touchUpInside)
        return button
    }()

    private let inviteButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(inviteButtonPressed), for: .touchUpInside)
        return button
    }()

    private let feedbackButton = {
        let button = UIButton()
        button.addTarget(nil, action: #selector(feedbackButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupUI()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.addSubview(discountCardView)
        discountCardView.addSubview(discountCardLogoImageView)
        discountCardView.addSubview(discountLabel)
        discountCardView.addSubview(discountCardNumber)
        discountCardView.addSubview(qrCodeButton)
        discountCardView.addSubview(cardInfoButton)
        view.addSubview(menuTitle)
        view.addSubview(userInfoButton)
        view.addSubview(inviteButton)
        view.addSubview(feedbackButton)
    }

    private func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        title = Constants.title
        setupDiscountCardView()
        setupDiscountCardLogoImageView()
        setupDiscountLabel()
        setupDiscountCardNumber()
        setupQrCodeButton()
        setupCardInfoButton()
        setupMenuTitle()
        setupUserInfoButton()
        setupInviteButton()
        setupfeedBackButton()
    }

    private func setupDiscountCardView() {
        discountCardView.translatesAutoresizingMaskIntoConstraints = false
        discountCardView.backgroundColor = .black
        discountCardView.layer.cornerRadius = 20
        discountCardView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        discountCardView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        discountCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        discountCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23).isActive = true
    }

    private func setupDiscountCardLogoImageView() {
        discountCardLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        discountCardLogoImageView.image = UIImage(named: Constants.logoImageName)
        discountCardLogoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        discountCardLogoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        discountCardLogoImageView.leftAnchor.constraint(equalTo: discountCardView.leftAnchor, constant: 8)
            .isActive = true
        discountCardLogoImageView.topAnchor.constraint(equalTo: discountCardView.topAnchor, constant: 16)
            .isActive = true
    }

    private func setupDiscountLabel() {
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.text = Constants.discount
        discountLabel.font = UIFont(name: Constants.titleFont, size: Constants.regularFontSize)
        discountLabel.textColor = Constants.cardLabelColor

        discountLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        discountLabel.leftAnchor.constraint(equalTo: discountCardView.leftAnchor, constant: 14).isActive = true
        discountLabel.topAnchor.constraint(equalTo: discountCardView.topAnchor, constant: 116).isActive = true
    }

    private func setupDiscountCardNumber() {
        discountCardNumber.translatesAutoresizingMaskIntoConstraints = false
        discountCardNumber.text = Constants.discountCardNumber
        discountCardNumber.font = UIFont(name: Constants.regularFont, size: Constants.smallFontSize)
        discountCardNumber.textColor = Constants.cardLabelColor

        discountCardNumber.widthAnchor.constraint(equalToConstant: 118).isActive = true
        discountCardNumber.heightAnchor.constraint(equalToConstant: 17).isActive = true
        discountCardNumber.leftAnchor.constraint(equalTo: discountCardView.leftAnchor, constant: 14).isActive = true
        discountCardNumber.topAnchor.constraint(equalTo: discountCardView.topAnchor, constant: 142).isActive = true
    }

    private func setupQrCodeButton() {
        qrCodeButton.translatesAutoresizingMaskIntoConstraints = false
        qrCodeButton.setImage(UIImage(named: Constants.qrCodeImageName), for: .normal)
        qrCodeButton.backgroundColor = Constants.cardButtonBackgroundColor
        qrCodeButton.layer.cornerRadius = 15

        qrCodeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        qrCodeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        qrCodeButton.rightAnchor.constraint(equalTo: discountCardView.rightAnchor, constant: -13).isActive = true
        qrCodeButton.topAnchor.constraint(equalTo: discountCardView.topAnchor, constant: 13).isActive = true
    }

    private func setupCardInfoButton() {
        cardInfoButton.translatesAutoresizingMaskIntoConstraints = false
        cardInfoButton.setImage(UIImage(named: Constants.infoCardImageName), for: .normal)
        cardInfoButton.backgroundColor = Constants.cardButtonBackgroundColor
        cardInfoButton.layer.cornerRadius = 15

        cardInfoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        cardInfoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cardInfoButton.rightAnchor.constraint(equalTo: discountCardView.rightAnchor, constant: -14).isActive = true
        cardInfoButton.bottomAnchor.constraint(equalTo: discountCardView.bottomAnchor, constant: -20).isActive = true
    }

    private func setupMenuTitle() {
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        menuTitle.text = Constants.menuTitle
        menuTitle.font = UIFont(name: Constants.titleFont, size: Constants.regularFontSize)

        menuTitle.widthAnchor.constraint(equalToConstant: 163).isActive = true
        menuTitle.heightAnchor.constraint(equalToConstant: 22).isActive = true
        menuTitle.topAnchor.constraint(equalTo: discountCardView.bottomAnchor, constant: 28).isActive = true
        menuTitle.leftAnchor.constraint(equalTo: discountCardView.leftAnchor).isActive = true
    }

    private func setupUserInfoButton() {
        userInfoButton.translatesAutoresizingMaskIntoConstraints = false

        userInfoButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        userInfoButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        userInfoButton.leftAnchor.constraint(equalTo: menuTitle.leftAnchor).isActive = true
        userInfoButton.topAnchor.constraint(equalTo: menuTitle.bottomAnchor, constant: 22).isActive = true

        let buttonImageView = UIImageView()
        let buttonLabel = UILabel()
        let separator = UIView()

        userInfoButton.addSubview(buttonImageView)
        userInfoButton.addSubview(buttonLabel)
        userInfoButton.addSubview(separator)

        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonImageView.image = UIImage(named: Constants.userInfoImageName)
        buttonImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        buttonImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonImageView.leftAnchor.constraint(equalTo: userInfoButton.leftAnchor, constant: 3).isActive = true
        buttonImageView.bottomAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: -9).isActive = true

        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.text = Constants.personalData
        buttonLabel.font = UIFont(name: Constants.regularFont, size: Constants.regularFontSize)
        buttonLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        buttonLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLabel.leftAnchor.constraint(equalTo: userInfoButton.leftAnchor, constant: 57).isActive = true
        buttonLabel.topAnchor.constraint(equalTo: userInfoButton.topAnchor).isActive = true

        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = Constants.separatorColor
        separator.widthAnchor.constraint(equalToConstant: 335).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.leftAnchor.constraint(equalTo: userInfoButton.leftAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: -1).isActive = true
    }

    private func setupInviteButton() {
        inviteButton.translatesAutoresizingMaskIntoConstraints = false

        inviteButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        inviteButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        inviteButton.leftAnchor.constraint(equalTo: userInfoButton.leftAnchor).isActive = true
        inviteButton.topAnchor.constraint(equalTo: userInfoButton.bottomAnchor, constant: 20).isActive = true

        let buttonImageView = UIImageView()
        let buttonLabel = UILabel()
        let separator = UIView()

        inviteButton.addSubview(buttonImageView)
        inviteButton.addSubview(buttonLabel)
        inviteButton.addSubview(separator)

        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonImageView.image = UIImage(named: Constants.inviteImageName)
        buttonImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        buttonImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonImageView.leftAnchor.constraint(equalTo: inviteButton.leftAnchor, constant: 3).isActive = true
        buttonImageView.bottomAnchor.constraint(equalTo: inviteButton.bottomAnchor, constant: -9).isActive = true

        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.text = Constants.inviteFriend
        buttonLabel.font = UIFont(name: Constants.regularFont, size: Constants.regularFontSize)
        buttonLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        buttonLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLabel.leftAnchor.constraint(equalTo: inviteButton.leftAnchor, constant: 57).isActive = true
        buttonLabel.topAnchor.constraint(equalTo: inviteButton.topAnchor).isActive = true

        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = Constants.separatorColor
        separator.widthAnchor.constraint(equalToConstant: 335).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.leftAnchor.constraint(equalTo: inviteButton.leftAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: inviteButton.bottomAnchor, constant: -1).isActive = true
    }

    private func setupfeedBackButton() {
        feedbackButton.translatesAutoresizingMaskIntoConstraints = false

        feedbackButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        feedbackButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        feedbackButton.leftAnchor.constraint(equalTo: inviteButton.leftAnchor).isActive = true
        feedbackButton.topAnchor.constraint(equalTo: inviteButton.bottomAnchor, constant: 20).isActive = true

        let buttonImageView = UIImageView()
        let buttonLabel = UILabel()
        let separator = UIView()

        feedbackButton.addSubview(buttonImageView)
        feedbackButton.addSubview(buttonLabel)
        feedbackButton.addSubview(separator)

        buttonImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonImageView.image = UIImage(named: Constants.feedbackImageName)
        buttonImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        buttonImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        buttonImageView.leftAnchor.constraint(equalTo: feedbackButton.leftAnchor, constant: 3).isActive = true
        buttonImageView.bottomAnchor.constraint(equalTo: feedbackButton.bottomAnchor, constant: -9).isActive = true

        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonLabel.text = Constants.feedback
        buttonLabel.font = UIFont(name: Constants.regularFont, size: Constants.regularFontSize)
        buttonLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        buttonLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        buttonLabel.leftAnchor.constraint(equalTo: feedbackButton.leftAnchor, constant: 57).isActive = true
        buttonLabel.topAnchor.constraint(equalTo: feedbackButton.topAnchor).isActive = true

        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = Constants.separatorColor
        separator.widthAnchor.constraint(equalToConstant: 335).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separator.leftAnchor.constraint(equalTo: feedbackButton.leftAnchor).isActive = true
        separator.bottomAnchor.constraint(equalTo: feedbackButton.bottomAnchor, constant: -1).isActive = true
    }

    @objc private func qrCodeButtonPressed() {
        print("QR Pressed")
    }

    @objc private func cardInfoButtonPressed() {
        print("Card Info Pressed")
    }

    @objc private func userInfoButtonPressed() {
        print("User Info Pressed")
        let userDataVC = UserDataViewController()
        let navigationController = UINavigationController(rootViewController: userDataVC)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    @objc private func inviteButtonPressed() {
        print("Invite Pressed")
    }

    @objc private func feedbackButtonPressed() {
        print("Feedback Pressed")
    }
}
