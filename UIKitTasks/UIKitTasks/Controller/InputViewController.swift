// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Input View Controller
final class InputViewController: UIViewController {
    // MARK: - Private Properties

    private let guessNumber = GuessNumber()

    private let backgroundImageView = {
        let image = UIImage(named: "Background")
        let imageView = UIImageView(image: image)
        imageView.sizeToFit()
        return imageView
    }()

    private let greeatingLabel = {
        let label = UILabel()
        label.text = "Приветствую,\n"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.backgroundColor = UIColor(named: "backgoundLabelColor")
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 3
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let guessButton = {
        let button = UIButton(frame: CGRect(x: 82, y: 300, width: 150, height: 150))
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

    private let calculateButton = {
        let button = UIButton(frame: CGRect(x: 132, y: 500, width: 200, height: 200))
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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        addSubviews()
        addTargetsForButtons()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addGetGreatingAlert()
    }

    // MARK: - Private Methods

    private func addGetGreatingAlert() {
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

    private func addGetResultAlertFrom(_ firstNumber: Int, _ secondNumber: Int) {
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

    private func addCheckNumberAlert(_ number: Int) {
        let checkNumberAlert = UIAlertController(
            title: "Поздравляю",
            message: "Вы угадали",
            preferredStyle: .alert
        )

        if guessNumber.checkNumber(number) {
            checkNumberAlert.title = "Поздравляю!"
            checkNumberAlert.message = "Вы угадали"
        } else {
            checkNumberAlert.title = "Упс!"
            checkNumberAlert.message = "Это неверный ответ"
        }

        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        checkNumberAlert.addAction(okAction)

        present(checkNumberAlert, animated: true)
    }

    private func addTargetsForButtons() {
        guessButton.addTarget(nil, action: #selector(addGuessNumbersAlert), for: .touchUpInside)
        calculateButton.addTarget(nil, action: #selector(addCalculateNumbersAlert), for: .touchUpInside)
    }

    private func addSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(greeatingLabel)
        view.addSubview(guessButton)
        view.addSubview(calculateButton)

        backgroundImageView.frame.size = view.frame.size

        greeatingLabel.frame.size.width = view.frame.size.width
        greeatingLabel.frame.size.height = 82
        greeatingLabel.frame.origin.y = 50
    }

    @objc func addCalculateNumbersAlert() {
        let calculateAlert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        calculateAlert.addTextField { textField in
            textField.placeholder = "Число 1"
        }

        calculateAlert.addTextField { textField in
            textField.placeholder = "Число 2"
        }

        let appendAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            let firstNumber = Int(calculateAlert.textFields?[0].text ?? "0") ?? 0
            let secondNumber = Int(calculateAlert.textFields?[1].text ?? "0") ?? 0

            self.addGetResultAlertFrom(firstNumber, secondNumber)
        }
        calculateAlert.addAction(appendAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        calculateAlert.addAction(cancelAction)

        present(calculateAlert, animated: true)
    }

    @objc func addGuessNumbersAlert() {
        let guessAlert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)

        guessAlert.addTextField { textField in
            textField.placeholder = "Введите число"
        }

        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let number = Int(guessAlert.textFields?[0].text ?? "0") ?? 0
            self.addCheckNumberAlert(number)
        }
        guessAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        guessAlert.addAction(cancelAction)

        present(guessAlert, animated: true)
    }
}
