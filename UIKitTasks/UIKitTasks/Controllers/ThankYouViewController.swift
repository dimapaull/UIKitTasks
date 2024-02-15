// ThankYouViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Переход на корневой контроллер
protocol Dismissable: AnyObject {
    /// Уведомление для принимающего, что контроллер только что был закртыт
    func didDismissModal()
}

/// Контроллер благодрности
final class ThankYouViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let thankYouText = """
        Разскажи о насъ другу, отправь ему
        промокодъ
        на безплатный напитокъ и получи
        скидку 10% на слѣдующій заказъ.
        """
        static let okText = "Хорошо"
    }

    // MARK: - Visual Components

    private let closeButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 40, width: 24, height: 24))
        button.setImage(.cross, for: .normal)
        button.addTarget(nil, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    private let flowersImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 58, width: 200, height: 86))
        imageView.image = .thankYouFlowers
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let thankYouImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 184, width: 235, height: 128))
        imageView.image = .thankYou
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let welcomeLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 362, width: 315, height: 89))
        label.text = Constants.thankYouText
        label.textColor = .appGray
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    private let okButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 664, width: 345, height: 53))
        button.setTitle(Constants.okText, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .appAquaBlue
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(closeViewController), for: .touchUpInside)
        return button
    }()

    // MARK: - Public Properties

    /// Делегирование перехода на корневой контроллер при исчезновении модального
    weak var delegate: Dismissable?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubviewsInMainView()
        view.backgroundColor = .white
        flowersImageView.center.x = view.center.x
        thankYouImageView.center.x = view.center.x
        welcomeLabel.center.x = view.center.x
        okButton.center.x = view.center.x
    }

    private func addSubviewsInMainView() {
        view.addSubview(closeButton)
        view.addSubview(flowersImageView)
        view.addSubview(thankYouImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(okButton)
    }

    /// Вызывается при нажатии на кнопку хорошо. Этот метод сначала говорит контроллеру, который его представлял, и
    /// после чего скрывается сам
    @objc private func closeViewController() {
        delegate?.didDismissModal()
        dismiss(animated: false)
    }
}
