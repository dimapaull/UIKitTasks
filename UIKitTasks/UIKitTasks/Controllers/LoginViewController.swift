// LoginViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для входа в аккаунт пользователя
final class LoginViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let authorizationText = "Авторизация"
        static let loginText = "Логин"
        static let passwordText = "Пароль"
        static let comeInText = "Войти"
        static let mailTextFieldPlaceholder = "Введите почту"
        static let passwordTextFieldPlaceholder = "Ввердите пароль"
        static let passwordLeftMargin = 10
    }

    // MARK: - Visual Components

    private let logoImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 103, width: 175, height: 76))
        imageView.image = .logo
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
        label.text = Constants.authorizationText
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 26)
        return label
    }()

    private let loginLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 332, width: 175, height: 19))
        label.text = Constants.loginText
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let passwordLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 407, width: 175, height: 19))
        label.text = Constants.passwordText
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private lazy var loginTextField = {
        let textFiled = UITextField(frame: CGRect(x: 0, y: 361, width: 335, height: 25))
        textFiled.placeholder = Constants.mailTextFieldPlaceholder
        textFiled.delegate = self
        textFiled.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        textFiled.addLine()
        return textFiled
    }()

    private let securePasswordButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 436, width: 22, height: 19))
        button.setImage(.passwordHide, for: .normal)
        button.addTarget(nil, action: #selector(changeSecureTextField(_:)), for: .touchUpInside)
        return button
    }()

    private let loginButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 664, width: 335, height: 44))
        button.setTitle(Constants.comeInText, for: .normal)
        button.alpha = 0.5
        button.isEnabled = false
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .appAquaBlue
        button.layer.cornerRadius = 12
        button.addTarget(nil, action: #selector(menuTransitionPressed), for: .touchUpInside)
        return button
    }()

    private lazy var passwordTextField = {
        let textFiled = UITextField(frame: CGRect(x: 0, y: 436, width: 335, height: 25))
        textFiled.placeholder = Constants.passwordTextFieldPlaceholder
        textFiled.addTarget(self, action: #selector(textDidChangeIn), for: .editingChanged)
        textFiled.isSecureTextEntry = true
        textFiled.delegate = self
        textFiled.addLine()
        return textFiled
    }()

    // MARK: - Private Properties

    private var validateUserData = ValidateUserData()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        /// Назвачение делегата для валидации почты и пароля
        validateUserData.delegate = self
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubviewsInMainView()
        view.backgroundColor = .appDarkBrown
        logoImageView.center.x = view.center.x
        whiteBackgrourdView.frame.size = CGSize(width: view.frame.width, height: 700)
        whiteBackgrourdView.center.x = view.center.x
        loginTextField.center.x = view.center.x
        passwordTextField.center.x = view.center.x
        securePasswordButton.frame = CGRect(
            x: Int(passwordTextField.frame.width) - Constants.passwordLeftMargin,
            y: 0,
            width: 22,
            height: 19
        )
        securePasswordButton.center.y = passwordTextField.center.y
        loginButton.center.x = view.center.x
    }

    private func addSubviewsInMainView() {
        view.addSubview(logoImageView)
        view.addSubview(whiteBackgrourdView)
        view.addSubview(authorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(passwordLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(securePasswordButton)
        view.addSubview(loginButton)
    }

    private func switchLogInButtonStateTo(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
        loginButton.alpha = loginButton.isEnabled ? 1 : 0.5
    }

    @objc private func changeSecureTextField(_ button: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let image = passwordTextField.isSecureTextEntry ? UIImage.passwordShow : .passwordHide
        button.setImage(image, for: .normal)
    }

    @objc private func textDidChangeIn(_ sender: UITextField) {
        switch sender {
        case loginTextField:
            validateUserData.mail = sender.text
        case passwordTextField:
            validateUserData.password = sender.text
        default:
            break
        }
    }

    @objc private func menuTransitionPressed() {
        let menuViewController = MenuViewController()
        let navigationController = UINavigationController(rootViewController: menuViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}

/// Расширение для использования методов делегата поля ввода
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}

/// Расширение, реализующее протокол, который нужен для валидации почты и пароля
extension LoginViewController: DataValidable {
    func dataValidChangeTo(_ isConform: Bool) {
        switchLogInButtonStateTo(isConform)
    }
}
