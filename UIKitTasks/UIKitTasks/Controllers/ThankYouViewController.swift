// ThankYouViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Rootable {
    func didDismissModal()
}

/// Контроллер благодрности
final class ThankYouViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let thankYouText = """
        Разскажи о насъ другу, отправь ему
        промокодъ
        на безплатный напитокъ и получи
        скидку 10% на слѣдующій заказъ.
        """
    }

    // MARK: - Public Properties

    /// Делегирование перехода на корневой контроллер при исчезновении модального
    var delegate: Rootable?

    // MARK: - Private Properties

    /// Кнопка крестика закрытия контроллера
    private let closeButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 40, width: 24, height: 24))
        button.setImage(UIImage.cross, for: .normal)
        button.addTarget(nil, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    /// Картинка цветов
    private let flowersImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 58, width: 200, height: 86))
        imageView.image = UIImage.thankYouFlowers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Картинка цветов
    private let thankYouImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 184, width: 235, height: 128))
        imageView.image = UIImage.thankYou
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    /// Надпись спасибо с упоминанием о купоне
    private let welcomeLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 362, width: 315, height: 89))
        label.text = Constants.thankYouText
        label.textColor = UIColor.appGray
        label.numberOfLines = 4
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    /// Кнопка хорошо, которая ведет на контроллер с меню
    private let okButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 664, width: 345, height: 53))
        button.setTitle("Хорошо", for: .normal)
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
        view.addSubview(closeButton)

        flowersImageView.center.x = view.center.x
        view.addSubview(flowersImageView)

        thankYouImageView.center.x = view.center.x
        view.addSubview(thankYouImageView)

        welcomeLabel.center.x = view.center.x
        view.addSubview(welcomeLabel)

        okButton.center.x = view.center.x
        view.addSubview(okButton)
    }

    /// Вызывается при нажатии на кнопку хорошо. Этот сначала говорит контроллеру, который его представлял, и потом скрывается сам
    @objc private func okButtonPressed() {
        delegate?.didDismissModal()
        dismiss(animated: false)
    }

    /// Вызывает при нажатии на крестик и просто скрывает модальный контроллер
    @objc private func closeViewController() {
        dismiss(animated: true)
    }
}
