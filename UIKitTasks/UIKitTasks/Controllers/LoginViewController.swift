// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для входа в аккаунт пользователя
final class LoginViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum LabelText {
            static let authorization = "Авторизация"
            static let login = "Логин"
            static let password = "Пароль"
        }

        enum TextFieldsPlaceholder {
            static let mail = "Введите почту"
            static let password = "Ввердите пароль"
        }
    }

    // MARK: - Private Properties

    private var validateModel = ValidateUserData()

    private let logoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 103, width: 175, height: 76))
        imageView.image = UIImage.logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let whiteBackgrourdView = {
        let view = UIView(frame: CGRect(x: 0, y: 248, width: 0, height: 564))
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    private let authorizationLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        label.text = Constants.LabelText.authorization
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    private let loginLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        label.text = Constants.LabelText.login
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private let passwordLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        label.text = Constants.LabelText.password
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()

    private lazy var loginTextField = {
        let textFiled = UITextField(frame: CGRect(x: 0, y: 361, width: 335, height: 25))
        textFiled.placeholder = Constants.TextFieldsPlaceholder.mail
        textFiled.delegate = self
        textFiled.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        textFiled.addLine()
        return textFiled
    }()

    private lazy var passwordTextField = {
        let textFiled = UITextField(frame: CGRect(x: 0, y: 436, width: 335, height: 25))
        textFiled.placeholder = Constants.TextFieldsPlaceholder.password
        textFiled.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        textFiled.isSecureTextEntry = true
        textFiled.delegate = self
        textFiled.addLine()
        return textFiled
    }()

    private let securePasswordButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 436, width: 22, height: 19))
        button.setImage(UIImage.passwordHide, for: .normal)
        button.addTarget(nil, action: #selector(changeSecureTextField(_:)), for: .touchUpInside)
        return button
    }()

    private let loginButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 664, width: 335, height: 44))
        button.setTitle("Войти", for: .normal)
        button.alpha = 0.5
        button.isEnabled = false
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor.appAquaBlue
        button.layer.cornerRadius = 12
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        validateModel.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = UIColor.appDarkBrown

        logoImageView.center.x = view.center.x
        view.addSubview(logoImageView)

        whiteBackgrourdView.frame.size = CGSize(width: view.frame.width, height: 700)
        whiteBackgrourdView.center.x = view.center.x
        view.addSubview(whiteBackgrourdView)

        view.addSubview(authorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)

        loginTextField.center.x = view.center.x
        view.addSubview(loginTextField)

        passwordTextField.center.x = view.center.x
        view.addSubview(passwordTextField)

        securePasswordButton.frame = CGRect(
            x: Int(passwordTextField.frame.width) - 10,
            y: 0,
            width: 22,
            height: 19
        )
        securePasswordButton.center.y = passwordTextField.center.y
        view.addSubview(securePasswordButton)

        loginButton.center.x = view.center.x
        view.addSubview(loginButton)
    }

    // MARK: - Private Methods

    /// Переключает доступность нажатия кнопки входа
    private func switchLogInButtonStateTo(_ isEnabled: Bool) {
        print(isEnabled)
        loginButton.isEnabled = isEnabled
        loginButton.alpha = loginButton.isEnabled ? 1 : 0.5
    }

    @objc private func changeSecureTextField(_ button: UIButton) {
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry.toggle()
            button.setImage(UIImage.passwordShow, for: .normal)
        } else {
            passwordTextField.isSecureTextEntry.toggle()
            button.setImage(UIImage.passwordHide, for: .normal)
        }
    }

    @objc private func textDidChangeIn(_ sender: UITextField) {
        switch sender {
        case loginTextField:
            validateModel.mail = sender.text
        case passwordTextField:
            validateModel.password = sender.text
        default:
            break
        }
    }
}

/// Расширение для использования методов делегата поля ввода
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

extension LoginViewController: DataValidable {
    func dataValidChangeTo(_ isConform: Bool) {
        switchLogInButtonStateTo(isConform)
    }
}
