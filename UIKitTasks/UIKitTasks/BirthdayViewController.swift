// BirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Контроллер для просмотра дней рождений
class BirthdayViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Names {
            static let helena = "Helena Link"
            static let verona = "Verona Trusk"
            static let alex = "Alex Smith"
            static let tom = "Tom Johnson"
        }

        enum Dates {
            static let helena = "10.03 - turns 25!"
            static let verona = "20.03 - turns 39"
            static let alex = "20.03 - turns 39"
            static let tom = "20.03 - turns 39"
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        setupImages()
        setupNavigaionBar()
        view.backgroundColor = .white
    }

    private func setupImages() {
        let helenaImage = createImageView(yPoint: 105, image: .helena)
        let veronaImage = createImageView(yPoint: 200, image: .verona)
        let alexImage = createImageView(yPoint: 295, image: .alex)
        let tomImage = createImageView(yPoint: 390, image: .tom)

        view.addSubview(helenaImage)
        view.addSubview(veronaImage)
        view.addSubview(alexImage)
        view.addSubview(tomImage)

        let helenaNameLabel = createNameLabel(yPoint: 119, name: Constants.Names.helena)
        let veronaNameLabel = createNameLabel(yPoint: 214, name: Constants.Names.verona)
        let alexNameLabel = createNameLabel(yPoint: 309, name: Constants.Names.alex)
        let tomNameLabel = createNameLabel(yPoint: 404, name: Constants.Names.tom)

        view.addSubview(helenaNameLabel)
        view.addSubview(veronaNameLabel)
        view.addSubview(alexNameLabel)
        view.addSubview(tomNameLabel)

        let helenaDateLabel = createBithdayLabel(yPoint: 147, date: Constants.Dates.helena)
        let veronaDatelabel = createBithdayLabel(yPoint: 242, date: Constants.Dates.verona)
        let alexDateLabel = createBithdayLabel(yPoint: 337, date: Constants.Dates.alex)
        let tomDateLabel = createBithdayLabel(yPoint: 432, date: Constants.Dates.tom)

        view.addSubview(helenaDateLabel)
        view.addSubview(veronaDatelabel)
        view.addSubview(alexDateLabel)
        view.addSubview(tomDateLabel)

        let helenaLeftDaysButton = createLeftDaysButton(yPoint: 119, days: 0)
        let veronaLeftDaysButton = createLeftDaysButton(yPoint: 214, days: 10)
        let alexLeftDaysButton = createLeftDaysButton(yPoint: 309, days: 42)
        let tomLeftDaysButton = createLeftDaysButton(yPoint: 404, days: 87)

        view.addSubview(helenaLeftDaysButton)
        view.addSubview(veronaLeftDaysButton)
        view.addSubview(alexLeftDaysButton)
        view.addSubview(tomLeftDaysButton)
    }

    private func setupNavigaionBar() {
        navigationItem.title = "Birthday Reminder"

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]

        let plusBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addNewBirthday)
        )
        navigationItem.rightBarButtonItem = plusBarButtonItem
    }

    private func createImageView(yPoint: Int, image: UIImage) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(x: 19, y: yPoint, width: 75, height: 75))
        imageView.image = image
        return imageView
    }

    private func createNameLabel(yPoint: Int, name: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 102, y: yPoint, width: 209, height: 20))
        label.text = name
        label.textAlignment = .left
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }

    private func createBithdayLabel(yPoint: Int, date: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 102, y: yPoint, width: 209, height: 20))
        label.text = date
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }

    private func createLeftDaysButton(yPoint: Int, days: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: 314, y: yPoint, width: 42, height: 44))
        button.setTitle("\(days) \ndays", for: .normal)
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.appDarkPurple, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        if days == 0 {
            button.setTitle("", for: .normal)
            button.setImage(.cake, for: .normal)
        }
        return button
    }

    @objc private func addNewBirthday() {
        let newBirthdayViewController = NewBirthdayViewController()
        present(newBirthdayViewController, animated: true)
    }
}
