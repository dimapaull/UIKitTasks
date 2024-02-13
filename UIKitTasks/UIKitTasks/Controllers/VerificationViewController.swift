// VerificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для подтверждения заказа по смс
final class VerificationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let controllerTitle = "Кодъ из СМС"
        static let controllerDescription = "Введите кодъ изъ смс, чтобы\n подтвердить оплату"
        static let sendAgain = "Отправить снова"
    }

    // MARK: - Private Properties

    /// Комментарий контроллера
    private let descriptionLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 146, width: 315, height: 44))
        label.text = Constants.controllerDescription
        label.numberOfLines = 2
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    /// Поле ввода полученного смс
    private lazy var codeFromSMSTextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 217, width: 262, height: 44))
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        return textField
    }()

    /// Кнопка запроса нового кода
    private let sendAgainButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 296, width: 141, height: 20))
        button.setTitle(Constants.sendAgain, for: .normal)
        button.setTitleColor(UIColor.appAquaBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        button.addTarget(nil, action: #selector(getNewCode), for: .touchUpInside)
        return button
    }()

    /// Кнопка подтвердить введенный код
    private let acceptButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 637, width: 345, height: 53))
        button.setTitle("Подтвердить", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.appAquaBlue
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(acceptButtonPressed), for: .touchUpInside)
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurateNavigationBar()
        setupUI()
        setupToolbar()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white

        descriptionLabel.center.x = view.center.x
        view.addSubview(descriptionLabel)

        codeFromSMSTextField.center.x = view.center.x
        view.addSubview(codeFromSMSTextField)

        sendAgainButton.center.x = view.center.x
        view.addSubview(sendAgainButton)

        acceptButton.center.x = view.center.x
        view.addSubview(acceptButton)
    }

    /// Тул бар, в котором есть кнопка ОК, для того, чтобы скрыть клавиатуру с цифрами
    private func setupToolbar() {
        let bar = UIToolbar()
        let okButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(dismissMyKeyboard))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        bar.items = [flexSpace, okButton]
        bar.sizeToFit()

        codeFromSMSTextField.inputAccessoryView = bar
    }

    /// Изменение названия контроллера
    private func configurateNavigationBar() {
        navigationItem.title = Constants.controllerTitle
    }

    /// Вызывается при каждом изменении текста в поле ввода кода
    @objc private func textDidChangeIn(_ sender: UITextField) {
        if sender.text?.count ?? 0 >= 4 {
            view.endEditing(true)
            acceptButton.isEnabled = true
            acceptButton.alpha = 1
        } else {
            acceptButton.isEnabled = false
            acceptButton.alpha = 0.5
        }
    }

    /// Вызывается, чтобы скрыть клаиатуру
    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }

    /// Вызывается при нажатии на кнопку подтвердить, после чего делается модальный переход на экран спасибо
    @objc private func acceptButtonPressed() {
        let thankYouController = ThankYouViewController()
        thankYouController.delegate = self
        thankYouController.modalPresentationStyle = .fullScreen
        present(thankYouController, animated: true)
    }

    /// Вызывается для получаения нового кода
    @objc private func getNewCode() {
        // TODO: Выполнить запрос нового кода
    }
}

/// Расширение, реализующее возврат в корневой контроллер
extension VerificationViewController: Rootable {
    func didDismissModal() {
        navigationController?.popToRootViewController(animated: true)
    }
}
