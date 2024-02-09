// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер с благодарностью о покупке
class ThanksViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var userMailLalel: UILabel!
    @IBOutlet var closeButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.layer.cornerRadius = 12
        view.backgroundColor = .white
        userMailLalel.text? += UserMail.shared.mail
    }

    // MARK: - IBAction

    @IBAction func pressClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
