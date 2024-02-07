// CheckViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Class Check View Controller
class CheckViewController: UIViewController {
    public var checkWord: String = ""

    let yourWordDescriptionLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 106, width: 275, height: 57))
        label.text = "Вы ввели слово"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    let yourWordLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 163, width: 275, height: 57))
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.layer.borderColor = UIColor.green.cgColor
        label.layer.borderWidth = 2
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()

    let reversedWordDescriptionLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 282, width: 275, height: 57))
        label.text = "А вот что получится, если\n читать справо налево"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()

    let reversedWordLabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 339, width: 275, height: 57))
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.layer.borderColor = UIColor.red.cgColor
        label.layer.borderWidth = 2
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }

    func setup() {
        yourWordDescriptionLabel.center.x = view.center.x
        yourWordLabel.center.x = view.center.x
        reversedWordDescriptionLabel.center.x = view.center.x
        reversedWordLabel.center.x = view.center.x

        yourWordLabel.text = checkWord
        view.addSubview(yourWordDescriptionLabel)
        view.addSubview(yourWordLabel)
        view.addSubview(reversedWordDescriptionLabel)
        view.addSubview(reversedWordLabel)
    }
}
