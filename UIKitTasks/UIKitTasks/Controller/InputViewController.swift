// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Input View Controller
class InputViewController: UIViewController {
    let startButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 400, width: 335, height: 44))
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.backgroundColor = .green
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    func setup() {
        startButton.center.x = view.center.x
        startButton.addTarget(nil, action: #selector(addCheckWordAlert), for: .touchUpInside)
        view.addSubview(startButton)
    }

    @objc func addCheckWordAlert() {
        let checkWordAlert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)

        checkWordAlert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }

        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            
        }
        checkWordAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        checkWordAlert.addAction(cancelAction)

        present(checkWordAlert, animated: true)
    }
}
