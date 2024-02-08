// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Input View Controller
class InputViewController: UIViewController {
    @IBOutlet var logoImage: UIImageView!
    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
        underlined(textFiled: mailTextField)
        underlined(textFiled: passwordTextField)

        mailTextField.delegate = self
        passwordTextField.delegate = self

        loginButton.layer.cornerRadius = 13
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

    @IBAction func secretButton(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            sender.setImage(UIImage(named: "Vector-2"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            sender.setImage(UIImage(named: "Vector-3"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
}

extension InputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
