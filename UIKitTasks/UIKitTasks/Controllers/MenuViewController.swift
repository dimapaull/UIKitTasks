// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для выбора категории продукта
final class MenuViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let welcomeText = "Добро пожаловать,\nГость"
        static let getAcessLocationText = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        static let locationsCafe = "Адреса кофеен"

        enum MenuItem {
            static let cupkake = "Пти пате аля «РюсЪ»"
            static let hotDrinks = "Горячiя напитки"
            static let coffee = "Кофий"
        }
    }

    // MARK: - Private Properties

    /// Картинка логотипа
    private let logoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 49, width: 175, height: 76))
        imageView.image = UIImage.logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Надпись добро пожаловать
    private let welcomeLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 147, width: 185, height: 44))
        label.text = Constants.welcomeText
        label.textColor = UIColor.appLightBrown
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    /// Аватар пользователя
    private let userAvatarButton = {
        let button = UIButton(frame: CGRect(x: 311, y: 147, width: 44, height: 44))
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.appAquaBlue
        button.layer.cornerRadius = button.frame.height / 2
        return button
    }()

    /// Белый закругленный фон
    private let whiteBackgroundView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 0, height: 700))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    /// Фон для локации
    private let locationBackgrourdView = {
        let view = UIView(frame: CGRect(x: 0, y: 40, width: 335, height: 70))
        view.backgroundColor = UIColor.appSoftBeige
        view.layer.cornerRadius = 16
        return view
    }()

    /// Адрес кофейни
    private let locationTitleLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 12, width: 150, height: 15))
        label.text = Constants.locationsCafe
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.textColor = .black
        label.layer.cornerRadius = 16
        return label
    }()

    /// Надпись с доступом для локации
    private let locationAccessLabel = {
        let label = UILabel(frame: CGRect(x: 15, y: 30, width: 260, height: 30))
        label.text = Constants.getAcessLocationText
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.appGray
        label.layer.cornerRadius = 16
        label.numberOfLines = 2
        return label
    }()

    /// Картинка с локацией
    private let locationImageView = {
        let imageView = UIImageView(frame: CGRect(x: 282, y: 17, width: 35, height: 35))
        imageView.image = UIImage.menuLocation
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Логотип (Минью)
    private let menuLogoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 122, width: 125, height: 80))
        imageView.image = UIImage.menu
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
        view.backgroundColor = UIColor.appDarkBrown

        logoImageView.center.x = view.center.x
        view.addSubview(logoImageView)

        view.addSubview(welcomeLabel)
        view.addSubview(userAvatarButton)

        whiteBackgroundView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        whiteBackgroundView.center.x = view.center.x
        view.addSubview(whiteBackgroundView)

        locationBackgrourdView.center.x = whiteBackgroundView.center.x
        whiteBackgroundView.addSubview(locationBackgrourdView)

        locationBackgrourdView.addSubview(locationImageView)
        locationBackgrourdView.addSubview(locationTitleLabel)
        locationBackgrourdView.addSubview(locationAccessLabel)

        menuLogoImageView.center.x = whiteBackgroundView.center.x
        whiteBackgroundView.addSubview(menuLogoImageView)

        addMenuItem(
            name: Constants.MenuItem.cupkake,
            image: UIImage.menuCupcake,
            yPoint: 216,
            xCenter: view.center.x
        )

        addMenuItem(
            name: Constants.MenuItem.hotDrinks,
            image: UIImage.menuDrinks,
            yPoint: 316,
            xCenter: view.center.x
        )

        addMenuItem(
            name: Constants.MenuItem.coffee,
            image: UIImage.menuCoffee,
            yPoint: 416,
            xCenter: view.center.x
        )
    }

    /// Метод который добавляет новый элемент в меню
    private func addMenuItem(
        name: String,
        image: UIImage,
        yPoint: Int,
        xCenter: CGFloat
    ) {
        let backgroundView = UIView(frame: CGRect(x: 0, y: yPoint, width: 335, height: 80))
        backgroundView.center.x = xCenter
        backgroundView.backgroundColor = UIColor.appLightBrown
        backgroundView.layer.cornerRadius = 16

        let selectGesture = UITapGestureRecognizer(target: self, action: #selector(selectItem))
        backgroundView.addGestureRecognizer(selectGesture)

        let nameItemLabel = UILabel(frame: CGRect(x: 49, y: yPoint + 40, width: 220, height: 19))
        nameItemLabel.text = name
        nameItemLabel.textAlignment = .left
        nameItemLabel.font = UIFont.boldSystemFont(ofSize: 16)
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

    /// Метод срабатывающий при выборе элемента из меню
    @objc private func selectItem() {
        let productViewConreoller = ProductConfigurateViewController()
        navigationController?.pushViewController(productViewConreoller, animated: true)
    }
}
