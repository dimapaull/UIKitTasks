// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для указания деталей заказа
class DetailViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var tableNumberTextField: UITextField!
    @IBOutlet private var personCountTextFild: UITextField!
    @IBOutlet private var nameTextField: UITextField!
    @IBOutlet private var billButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        view.backgroundColor = .white

        tableNumberTextField.delegate = self
        personCountTextFild.delegate = self
        nameTextField.delegate = self

        billButton.layer.cornerRadius = 12
        billButton.addTarget(nil, action: #selector(addBillAlert), for: .touchUpInside)

        underlined(textFiled: tableNumberTextField)
        underlined(textFiled: personCountTextFild)
        underlined(textFiled: nameTextField)
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

    private func pushCheckViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let checkViewController = storyboard.instantiateViewController(withIdentifier: "CheckViewController")

        navigationController?.pushViewController(checkViewController, animated: true)
    }

    @objc private func addBillAlert() {
        let billAlert = UIAlertController(title: "Выставить счет", message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        billAlert.addAction(cancelAction)

        let checkAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.pushCheckViewController()
        }
        billAlert.addAction(checkAction)

        present(billAlert, animated: true)
    }
}

// MARK: - Extension UITextFieldDelegate

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
