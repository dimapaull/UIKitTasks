// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для входа в аккаунт
final class InputViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var logoImage: UIImageView!
    @IBOutlet private var mailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var loginButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        view.backgroundColor = .white

        underlined(textFiled: mailTextField)
        underlined(textFiled: passwordTextField)

        mailTextField.delegate = self
        passwordTextField.delegate = self

        loginButton.layer.cornerRadius = 13
        loginButton.addTarget(nil, action: #selector(addMail), for: .touchUpInside)
    }

    private func underlined(textFiled: UITextField) {
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

    @objc func addMail() {
        UserMail.shared.mail = mailTextField.text ?? ""
    }

    // MARK: - IBAction

    @IBAction private func secretButton(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            sender.setImage(UIImage(named: "Vector-2"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            sender.setImage(UIImage(named: "Vector-3"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
}

// MARK: - Extension UITextFieldDelegate

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
