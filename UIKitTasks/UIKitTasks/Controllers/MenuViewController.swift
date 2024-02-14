// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для выбора категории продукта
final class MenuViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let welcomeText = "Добро пожаловать,\nГость"
        static let getAcessLocationText = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        static let locationsCafe = "Адреса кофеен"
        static let cupkakeItemName = "Пти пате аля «РюсЪ»"
        static let hotDrinksItemName = "Горячiя напитки"
        static let coffeeItemName = "Кофий"
        static let cornerCoefficient: CGFloat = 2
        static let labelBottomMargin = 40
    }

    // MARK: - Visual Components

    private let logoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 49, width: 175, height: 76))
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let welcomeLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        label.text = Constants.welcomeText
        label.textColor = .appLightBrown
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let userAvatarButton = {
        let button = UIButton(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .appAquaBlue
        button.layer.cornerRadius = button.frame.height / Constants.cornerCoefficient
        return button
    }()

    private let whiteBackgroundView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 0, height: 700))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let locationBackgrourdView = {
        let view = UIView(frame: CGRect(x: 0, y: 40, width: 335, height: 70))
        view.backgroundColor = .appSoftBeige
        view.layer.cornerRadius = 16
        return view
    }()

    private let locationTitleLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 12, width: 150, height: 15))
        label.text = Constants.locationsCafe
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.layer.cornerRadius = 16
        return label
    }()

    private let locationAccessLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 30, width: 260, height: 30))
        label.text = Constants.getAcessLocationText
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        label.textColor = .appGray
        label.layer.cornerRadius = 16
        label.numberOfLines = 2
        return label
    }()

    private let locationImageView = {
        let imageView = UIImageView(frame: CGRect(x: 282, y: 17, width: 35, height: 35))
        imageView.image = .menuLocation
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let menuLogoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 122, width: 125, height: 80))
        imageView.image = .menu
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubviewsView()
        view.backgroundColor = .appDarkBrown
        logoImageView.center.x = view.center.x
        whiteBackgroundView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        whiteBackgroundView.center.x = view.center.x
        locationBackgrourdView.center.x = whiteBackgroundView.center.x
        menuLogoImageView.center.x = whiteBackgroundView.center.x

        addMenuItem(
            name: Constants.cupkakeItemName,
            image: .menuCupcake,
            yPoint: 216,
            xCenter: view.center.x
        )

        addMenuItem(
            name: Constants.hotDrinksItemName,
            image: .menuDrinks,
            yPoint: 316,
            xCenter: view.center.x
        )

        addMenuItem(
            name: Constants.coffeeItemName,
            image: .menuCoffee,
            yPoint: 416,
            xCenter: view.center.x
        )
    }

    private func addSubviewsView() {
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(userAvatarButton)
        view.addSubview(whiteBackgroundView)
        whiteBackgroundView.addSubview(locationBackgrourdView)
        locationBackgrourdView.addSubview(locationImageView)
        locationBackgrourdView.addSubview(locationTitleLabel)
        locationBackgrourdView.addSubview(locationAccessLabel)
        whiteBackgroundView.addSubview(menuLogoImageView)
    }

    /// Метод который добавляет новый элемент в меню
    private func addMenuItem(name: String, image: UIImage, yPoint: Int, xCenter: CGFloat) {
        let backgroundView = UIView(frame: CGRect(x: 0, y: yPoint, width: 335, height: 80))
        backgroundView.center.x = xCenter
        backgroundView.backgroundColor = .appLightBrown
        backgroundView.layer.cornerRadius = 16

        let selectGesture = UITapGestureRecognizer(target: self, action: #selector(selectItem))
        backgroundView.addGestureRecognizer(selectGesture)

        let nameItemLabel = UILabel(frame: CGRect(
            x: 49,
            y: yPoint + Constants.labelBottomMargin,
            width: 220,
            height: 19
        ))
        nameItemLabel.text = name
        nameItemLabel.textAlignment = .left
        nameItemLabel.font = .boldSystemFont(ofSize: 16)
        nameItemLabel.textColor = .black
        nameItemLabel.center.y = backgroundView.center.y

        let itemImageView = UIImageView(image: image)
        itemImageView.contentMode = .scaleAspectFit
        itemImageView.frame = CGRect(x: 272, y: yPoint, width: 70, height: 70)
        itemImageView.center.y = backgroundView.center.y

        whiteBackgroundView.addSubview(backgroundView)
        whiteBackgroundView.addSubview(nameItemLabel)
        whiteBackgroundView.addSubview(itemImageView)
    }

    @objc private func selectItem() {
        let productViewController = ProductConfigurateViewController()
        navigationController?.pushViewController(productViewController, animated: true)
    }
}
