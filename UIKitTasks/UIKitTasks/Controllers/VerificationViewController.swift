// VerificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для подтверждения заказа по смс
final class VerificationViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let controllerTitle = "Кодъ из СМС"
        static let controllerDescription = "Введите кодъ изъ смс, чтобы\n подтвердить оплату"
        static let sendAgain = "Отправить снова"
        static let acceptText = "Подтвердить"
        static let okText = "Подтвердить"
        static let minimumSimbols = 4
    }

    // MARK: - Visual Components

    private let descriptionLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 146, width: 315, height: 44))
        label.text = Constants.controllerDescription
        label.numberOfLines = 2
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    private let sendAgainButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 296, width: 141, height: 20))
        button.setTitle(Constants.sendAgain, for: .normal)
        button.setTitleColor(.appAquaBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .center
        return button
    }()

    private let acceptButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 637, width: 345, height: 53))
        button.setTitle(Constants.acceptText, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .appAquaBlue
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(acceptButtonPressed), for: .touchUpInside)
        button.alpha = 0.5
        button.isEnabled = false
        return button
    }()

    private lazy var codeFromSMSTextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 217, width: 262, height: 44))
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 10
        textField.keyboardType = .numberPad
        textField.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        return textField
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
        addSubviewsInMainView()
        descriptionLabel.center.x = view.center.x
        codeFromSMSTextField.center.x = view.center.x
        sendAgainButton.center.x = view.center.x
        acceptButton.center.x = view.center.x
    }

    private func addSubviewsInMainView() {
        view.addSubview(descriptionLabel)
        view.addSubview(codeFromSMSTextField)
        view.addSubview(sendAgainButton)
        view.addSubview(acceptButton)
    }

    private func setupToolbar() {
        let bar = UIToolbar()
        let okButton = UIBarButtonItem(
            title: Constants.okText,
            style: .done,
            target: self,
            action: #selector(dismissMyKeyboard)
        )
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        bar.items = [flexSpace, okButton]
        bar.sizeToFit()

        codeFromSMSTextField.inputAccessoryView = bar
    }

    private func configurateNavigationBar() {
        navigationItem.title = Constants.controllerTitle
        UINavigationBar.appearance().backIndicatorImage = .leftArrow

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage.leftArrow,
            style: .plain,
            target: nil,
            action: nil
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    @objc private func textDidChangeIn(_ sender: UITextField) {
        if sender.text?.count ?? 0 >= Constants.minimumSimbols {
            view.endEditing(true)
            acceptButton.isEnabled = true
            acceptButton.alpha = 1
        } else {
            acceptButton.isEnabled = false
            acceptButton.alpha = 0.5
        }
    }

    @objc private func dismissMyKeyboard() {
        view.endEditing(true)
    }

    @objc private func acceptButtonPressed() {
        let thankYouController = ThankYouViewController()
        thankYouController.delegate = self
        thankYouController.modalPresentationStyle = .fullScreen
        present(thankYouController, animated: true)
    }
}

/// Расширение, реализующее возврат в корневой контроллер
extension VerificationViewController: Rootable {
    /// Длеает возврат в корневой контроллер свой при вызове из делегата
    func didDismissModal() {
        navigationController?.popToRootViewController(animated: true)
    }
}
