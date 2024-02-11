// ResultView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Протокол для вызова алерта
protocol AlertDelegate: AnyObject {
    func addCheckWordAlert()
}

/// Вью для начального экрана
class InputView: UIView {
    // MARK: - Constants

    weak var delegate: AlertDelegate?

    let startButton = {
        let button = UIButton(frame: CGRect(x: 50, y: 400, width: 290, height: 44))
        button.setTitle("Начать", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 12
        button.backgroundColor = .green
        button.addTarget(nil, action: #selector(addCheckWordAlert), for: .touchUpInside)
        return button
    }()

    init(frame: CGRect, isStartView: Bool) {
        super.init(frame: frame)
        if isStartView {
            createStartView()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func createStartView() {
        backgroundColor = .white
        addSubview(startButton)
    }

    func getViewWithLabel(inputWord: String, reversedWord: String) {
        backgroundColor = .white
        startButton.frame = CGRect(x: 50, y: 600, width: 290, height: 44)

        let yourWordDescriptionLabel = {
            let label = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
            label.text = "Вы ввели слово"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .black
            label.textAlignment = .center
            return label
        }()

        let yourWordLabel = {
            let label = UILabel(frame: CGRect(x: 50, y: 163, width: 275, height: 57))
            label.text = inputWord
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.layer.borderColor = UIColor.green.cgColor
            label.layer.borderWidth = 2
            label.textColor = .lightGray
            label.textAlignment = .center
            return label
        }()

        let reversedWordDescriptionLabel = {
            let label = UILabel(frame: CGRect(x: 50, y: 282, width: 275, height: 57))
            label.text = "А вот что получится, если\n читать справо налево"
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .black
            label.numberOfLines = 2
            label.textAlignment = .center
            return label
        }()

        let reversedWordLabel = {
            let label = UILabel(frame: CGRect(x: 50, y: 339, width: 275, height: 57))
            label.text = reversedWord
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.layer.borderColor = UIColor.red.cgColor
            label.layer.borderWidth = 2
            label.textColor = .lightGray
            label.textAlignment = .center
            return label
        }()

        addSubview(yourWordDescriptionLabel)
        addSubview(yourWordLabel)
        addSubview(reversedWordDescriptionLabel)
        addSubview(reversedWordLabel)
        addSubview(startButton)
    }

    @objc private func addCheckWordAlert() {
        delegate?.addCheckWordAlert()
    }
}
