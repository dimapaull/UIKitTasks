// ChooseRoastViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для выбора обжарки кофе
final class ChooseRoastViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let roastTitle = "Уточните обжарку зеренъ"

        enum Roast {
            static let dark = "Темная \nобжарка"
            static let light = "Свѣтлая \nобжарка"
        }
    }

    /// Определяет вид зерен
    enum RoastType: String {
        case dark = "Темная \nобжарка"
        case light = "Свѣтлая \nобжарка"
    }

    // MARK: - Private Properties

    /// Показывает текущий вид зерен, которые выбрал пользователь
    private var currentRoastType = RoastType.dark

    /// Кнопка крестика закрытия контроллера
    private let closeButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage.cross, for: .normal)
        button.addTarget(nil, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    /// Название вверху контроллера
    private let roastTitleLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 53, width: 294, height: 30))
        label.text = Constants.roastTitle
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    /// Вью для черной обжарки
    private let darkBackgroundView = {
        let view = UIView(frame: CGRect(x: 15, y: 102, width: 165, height: 165))
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.appSoftBeige
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.appAquaBlue.cgColor
        return view
    }()

    /// Вью для светлой обжарки
    private let lightBackgroundView = {
        let view = UIView(frame: CGRect(x: 195, y: 102, width: 165, height: 165))
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.appSoftBeige
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.appSoftBeige.cgColor
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(closeButton)

        roastTitleLabel.center.x = view.center.x
        view.addSubview(roastTitleLabel)

        view.addSubview(darkBackgroundView)
        view.addSubview(lightBackgroundView)

        addSubviewIn(
            view: darkBackgroundView,
            roastType: .dark,
            image: UIImage.darkRoast
        )

        addSubviewIn(
            view: lightBackgroundView,
            roastType: .light,
            image: UIImage.lightRoast
        )

        addGersture()
    }

    /// Метод, добавляющий запись тапов по вью видов зерен
    private func addGersture() {
        let selectDarkGesture = UITapGestureRecognizer(target: self, action: #selector(selectItem))
        let selectLightGesture = UITapGestureRecognizer(target: self, action: #selector(selectItem))
        darkBackgroundView.addGestureRecognizer(selectDarkGesture)
        lightBackgroundView.addGestureRecognizer(selectLightGesture)
    }

    /// Метод, который добавляет картинку зерен и их название во вью
    private func addSubviewIn(
        view: UIView,
        roastType: RoastType,
        image: UIImage
    ) {
        let roastImageView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        roastImageView.image = image
        roastImageView.contentMode = .scaleAspectFit

        let roastNameLabel = UILabel(frame: CGRect(x: 0, y: 117, width: 165, height: 34))
        roastNameLabel.numberOfLines = 2
        roastNameLabel.text = roastType.rawValue
        roastNameLabel.textAlignment = .center
        roastNameLabel.font = UIFont.boldSystemFont(ofSize: 14)

        view.addSubview(roastNameLabel)
        view.addSubview(roastImageView)
    }

    /// Обрабатывает нажатие по вью и меняет состояние текущего вида обжарки
    @objc private func selectItem(_ gesture: UIGestureRecognizer) {
        if currentRoastType == .dark, gesture.view != darkBackgroundView {
            lightBackgroundView.layer.borderColor = UIColor.appAquaBlue.cgColor
            darkBackgroundView.layer.borderColor = UIColor.appSoftBeige.cgColor
            currentRoastType = .light
        } else if gesture.view != lightBackgroundView {
            lightBackgroundView.layer.borderColor = UIColor.appSoftBeige.cgColor
            darkBackgroundView.layer.borderColor = UIColor.appAquaBlue.cgColor
            currentRoastType = .dark
        }
    }

    /// Обрабатывает нажатие на кнопку закрытия контроллера
    @objc private func closeViewController() {
        // TODO: Отсюда надо забрать выбранный тип обжарки зерен
        dismiss(animated: true)
    }
}
