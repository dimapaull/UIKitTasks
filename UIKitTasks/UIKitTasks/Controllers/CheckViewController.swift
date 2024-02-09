// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для подтвержения заказа
class CheckViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var payButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        payButton.layer.cornerRadius = 12
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func presentThanksViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let thanksViewController = storyboard.instantiateViewController(withIdentifier: "ThanksViewController")

        present(thanksViewController, animated: true)
    }

    // MARK: - IBAction

    @IBAction private func pressPay(_ sender: Any) {
        let payAlert = UIAlertController(title: "Вы хотите оплатить чек?", message: nil, preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Нет", style: .cancel)
        payAlert.addAction(cancelAction)

        let acceptAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.presentThanksViewController()
        }
        payAlert.addAction(acceptAction)

        present(payAlert, animated: true)
    }
}
