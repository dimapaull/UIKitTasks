// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Input View Controller
class InputViewController: UIViewController {
    let backgroundImageView = {
        let image = UIImage(named: "Background")
        let imageView = UIImageView(image: image)
        imageView.sizeToFit()
        return imageView
    }()

    let greeatingLabel = {
        let label = UILabel()
        label.text = "Приветствую,\n"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.backgroundColor = UIColor(named: "blueLabelColor")
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 3
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let guessButton = {
        let button = UIButton()
        button.backgroundColor = .systemPurple
        button.setTitle("Угадай\n число", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.titleLabel?.numberOfLines = 2
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.purple.cgColor
        return button
    }()

    let calculateButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.green.cgColor
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        addConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addGetGreatingAlert()
    }

    func addGetGreatingAlert() {
        let alert = UIAlertController(title: "Пожалуйста,\n представьтесь", message: nil, preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "Введите ваше имя"
        }

        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            let nameText = alert.textFields?.first?.text
            self.greeatingLabel.text?.append("\(nameText ?? "ИМЯ")!")
        }
        alert.addAction(action)

        present(alert, animated: true)
    }

    func addGetResultAlertFrom(_ firstNumber: Int, _ secondNumber: Int) {
        let resultAlert = UIAlertController(
            title: "Ваш результат",
            message: "Результат вычислений - \(firstNumber + secondNumber)",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Ок", style: .default)
        resultAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        resultAlert.addAction(cancelAction)

        present(resultAlert, animated: true)
    }

    @objc func addGetGuessNumbersAlert() {
        let guessAlert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        guessAlert.addTextField { textField in
            textField.placeholder = "Число 1"
        }

        guessAlert.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        let appendAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            let firstNumber = Int(guessAlert.textFields?[0].text ?? "0") ?? 0
            let secondNumber = Int(guessAlert.textFields?[1].text ?? "0") ?? 0

            self.addGetResultAlertFrom(firstNumber, secondNumber)
        }
        guessAlert.addAction(appendAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        guessAlert.addAction(cancelAction)

        present(guessAlert, animated: true)
    }

    func addConstraints() {
        view.addSubview(backgroundImageView)
        view.addSubview(greeatingLabel)
        view.addSubview(guessButton)
        view.addSubview(calculateButton)

        guessButton.addTarget(nil, action: #selector(addGetGuessNumbersAlert), for: .touchUpInside)

        backgroundImageView.frame.size = view.frame.size

        greeatingLabel.frame.size.width = view.frame.size.width
        greeatingLabel.frame.size.height = 82
        greeatingLabel.frame.origin.y = 50

        guessButton.frame.size = .init(width: 150, height: 150)
        guessButton.frame.origin.y = 300
        guessButton.frame.origin.x = 82

        calculateButton.frame.size = .init(width: 200, height: 200)
        calculateButton.frame.origin.y = 500
        calculateButton.frame.origin.x = 132
    }
}
