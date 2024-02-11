// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с полями для входа в аккаунт пользователя
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let birthdayReminderTitle = "Birthday \nReminder"
        static let calculatorButtonTitle = "Калькулятор"

        enum TextFiledPlaseholder {
            static let email = "Typing email"
            static let password = "Typing password"
        }
    }

    // MARK: - Private Properties

    private var user = User()

    /// Логотип
    private let logoImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.frame = CGRect(x: 0, y: 70, width: 125, height: 125)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    /// Заголовок(название приложения)
    private let logoHeaderLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 190, width: 175, height: 60))
        label.text = Constants.birthdayReminderTitle
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = UIColor.appDarkPurple
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()

    /// Надпись вход
    private let signInLabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 256, width: 175, height: 31))
        label.text = "Sign in"
        label.textAlignment = .left
        label.textColor = UIColor.appRed
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    /// Надпись почта
    private let emailTitleLabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 318, width: 175, height: 19))
        label.text = "Email"
        label.textAlignment = .left
        label.textColor = UIColor.appRed
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    /// Поле ввода почты
    private let emailTextField = {
        let textField = UITextField(frame: .init(x: 10, y: 347, width: 335, height: 25))
        textField.placeholder = Constants.TextFiledPlaseholder.email
        return textField
    }()

    /// Надпись пароль
    private let passwordTitleLabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 393, width: 175, height: 19))
        label.text = "Password"
        label.textAlignment = .left
        label.textColor = UIColor.appRed
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    /// Поле ввода пароля
    private let passwordTextField = {
        let textField = UITextField(frame: .init(x: 10, y: 422, width: 335, height: 25))
        textField.isSecureTextEntry = true
        textField.placeholder = Constants.TextFiledPlaseholder.password
        return textField
    }()

    /// Кнопка показа пароля
    private let showPasswordButton = {
        let button = UIButton(frame: .init(x: 320, y: 0, width: 22, height: 19))
        button.setImage(.hide, for: .normal)
        return button
    }()

    /// Надпись face id
    private let faceIdLabel = {
        let label = UILabel(frame: CGRect(x: 86, y: 544, width: 150, height: 35))
        label.text = "Use FaceID"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    /// Свитч face id
    private let faceIdSwitch = {
        let faceSwitch = UISwitch(frame: .init(x: 248, y: 544, width: 54, height: 35))
        faceSwitch.isOn = true
        return faceSwitch
    }()

    /// Кнопка вход
    private let loginButton = {
        let button = UIButton(frame: .init(x: 0, y: 670, width: 335, height: 44))
        button.isEnabled = false
        button.alpha = 0.5
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.appDarkPink
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        user.delegate = self
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white

        logoImageView.center.x = view.center.x
        logoHeaderLabel.center.x = view.center.x
        loginButton.center.x = view.center.x
        showPasswordButton.center.y = passwordTextField.center.y

        addLineFor(emailTextField)
        addLineFor(passwordTextField)

        emailTextField.delegate = self
        passwordTextField.delegate = self

        emailTextField.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)

        loginButton.addTarget(nil, action: #selector(goToBirthdayViewController), for: .touchUpInside)

        view.addSubview(logoImageView)
        view.addSubview(logoHeaderLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailTitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTitleLabel)
        view.addSubview(passwordTextField)
        view.addSubview(showPasswordButton)
        view.addSubview(loginButton)
    }

    private func addLineFor(_ textFiled: UITextField) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(
            x: 0,
            y: textFiled.frame.size.height - width,
            width: textFiled.frame.size.width,
            height: textFiled.frame.size.height
        )
        border.borderWidth = width
        textFiled.layer.addSublayer(border)
        textFiled.layer.masksToBounds = true
    }

    /// Переключает доступность нажатия кнопки входа
    private func switchLogInButtonStateTo(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
        view.addSubview(faceIdSwitch)
        view.addSubview(faceIdLabel)
        loginButton.alpha = loginButton.isEnabled ? 1 : 0.5
    }

    @objc private func goToBirthdayViewController() {
        let birthdayViewController = BirthdayViewController()
        navigationController?.pushViewController(birthdayViewController, animated: true)
    }

    @objc private func textDidChangeIn(_ sender: UITextField) {
        switch sender {
        case emailTextField:
            user.mail = sender.text
        case passwordTextField:
            user.password = sender.text
        default:
            break
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension LoginViewController: DataValidable {
    func dataValidChangeTo(_ doesConform: Bool) {
        switchLogInButtonStateTo(doesConform)
    }
}
