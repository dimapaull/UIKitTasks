// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Detail View Controller
class DetailViewController: UIViewController {
    @IBOutlet var tableNumberTextField: UITextField!
    @IBOutlet var personCountTextFild: UITextField!
    @IBOutlet var nameTextField: UITextField!

    @IBOutlet var billButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    private func setup() {
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

    func pushCheckViewController() {
        let checkVC = CheckViewController()

        navigationController?.pushViewController(checkVC, animated: true)
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
