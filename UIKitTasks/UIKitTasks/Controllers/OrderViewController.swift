// OrderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для итогового заказа. Тут перечислены все продукты заказа и итоговая стоимость
final class OrderViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let controllerTitle = "Вашъ Заказъ"
        static let pay = "Оплатить"
        static let startYPoint = 155
        static let marginItems = 36

        enum Price {
            static let priceText = "Цѣна -"
            static let currencyText = "Оплатить"
        }
    }

    // MARK: - Public Properties

    var finishPrice: Int?
    var orderItems: [OrderItem] = []

    // MARK: - Private Properties

    /// Кнопка крестика закрытия контроллера
    private let closeButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 26, width: 14, height: 14))
        button.setImage(UIImage.cross, for: .normal)
        button.addTarget(nil, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    /// Картинка левых цветов
    private let leftFringeImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 48, width: 100, height: 73))
        imageView.image = UIImage.leftFringe
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Картинка правых цветов
    private let rightFringeImageView = {
        let imageView = UIImageView(frame: CGRect(x: 260, y: 48, width: 100, height: 73))
        imageView.image = UIImage.rightFringe
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Название вверху контроллера
    private let controllerTitleLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 140, height: 30))
        label.text = Constants.controllerTitle
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    /// Цена всего чека
    private let finishPriceLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 433, width: 231, height: 30))
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    /// Картинка под ценой
    private let centerFringeImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 472, width: 100, height: 40))
        imageView.image = UIImage.centerFringe
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Кнопка оплатить, которая ведет на контроллер с смс
    private let okButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 664, width: 345, height: 53))
        button.setTitle("Оплатить", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.appAquaBlue
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(okButtonPressed), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white

        finishPriceLabel.text = "\(Constants.Price.priceText) \(finishPrice ?? 0) \(Constants.Price.currencyText)"

        view.addSubview(closeButton)
        view.addSubview(leftFringeImageView)
        view.addSubview(rightFringeImageView)

        controllerTitleLabel.center.x = view.center.x
        view.addSubview(controllerTitleLabel)

        finishPriceLabel.center.x = view.center.x
        view.addSubview(finishPriceLabel)

        centerFringeImageView.center.x = view.center.x
        view.addSubview(centerFringeImageView)

        okButton.center.x = view.center.x
        view.addSubview(okButton)

        createNameProductAndPrice(elements: orderItems)
    }

    private func createNameProductAndPrice(elements: [OrderItem]) {
        var startYPoint = Constants.startYPoint

        for item in elements {
            let nameProductLabel = UILabel(frame: CGRect(x: 20, y: startYPoint, width: 200, height: 30))
            nameProductLabel.textAlignment = .left
            nameProductLabel.font = UIFont.systemFont(ofSize: 16)
            nameProductLabel.text = item.name

            let priceProductLabel = UILabel(frame: CGRect(x: 225, y: startYPoint, width: 130, height: 30))
            priceProductLabel.textAlignment = .right
            priceProductLabel.font = UIFont.systemFont(ofSize: 16)
            priceProductLabel.text = "\(item.price) руб"

            if item == elements.first {
                nameProductLabel.font = UIFont.boldSystemFont(ofSize: 16)
                priceProductLabel.font = UIFont.boldSystemFont(ofSize: 16)
            }

            view.addSubview(nameProductLabel)
            view.addSubview(priceProductLabel)

            startYPoint += Constants.marginItems
        }
    }

    /// Обрабатывает нажатие на кнопку закрытия контроллера
    @objc private func closeViewController() {
        // TODO: Отсюда надо забрать выбранный тип обжарки зерен
        dismiss(animated: true)
    }

    /// Вызывается при нажатии на кнопку хорошо. Этот сначала говорит контроллеру, который его представлял, и потом
    /// скрывается сам
    @objc private func okButtonPressed() {
        // TODO: Сделать push контроллера с смс
    }
}
