// InputViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для старта приложения
final class InputViewController: UIViewController {
    // MARK: - Constants

    private lazy var mainView = InputView(frame: view.frame, isStartView: true)

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        mainView.delegate = self
        view.addSubview(mainView)
    }

    // MARK: - Private Methods

    private func updateTextInLabelsWith(_ word: String) {
        view.subviews.first?.removeFromSuperview()
        view.addSubview(InputView(frame: view.frame, isStartView: false))
        (view.subviews.first as? InputView)?.delegate = self
        (view.subviews.last as? InputView)?.getViewWithLabel(
            inputWord: word,
            reversedWord: Checker().reverce(word)
        )
    }
}

// Реализция метода делегата
extension InputViewController: AlertDelegate {
    func addCheckWordAlert() {
        let checkWordAlert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)

        checkWordAlert.addTextField { textField in
            textField.placeholder = "Введите слово"
        }

        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            let word = checkWordAlert.textFields?.first?.text

            self.updateTextInLabelsWith(word ?? "")
        }
        checkWordAlert.addAction(okAction)

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        checkWordAlert.addAction(cancelAction)

        present(checkWordAlert, animated: true)
    }
}
