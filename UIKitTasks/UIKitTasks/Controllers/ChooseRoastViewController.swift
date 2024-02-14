// ChooseRoastViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для выбора обжарки кофе
final class ChooseRoastViewController: UIViewController {
    // MARK: - Public Properties

    weak var firstViewController: ProductConfigurateViewController?

    // MARK: - Private Properties

    private let darkButton = UIButton()
    private let lightButton = UIButton()
    private let clarificationLabel = UILabel()

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        addViews()
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false

        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        backButton.tintColor = .black

        navigationItem.leftBarButtonItem = backButton
    }

    /// Настраиваем внешний вид элементов
    private func setupViews() {
        /// Настраиваем Заголовок
        clarificationLabel.text = "Уточните обжарку зеренъ"
        clarificationLabel.frame = CGRect(x: 40, y: 53, width: 294, height: 30)
        clarificationLabel.font = UIFont(name: "Verdana-Bold", size: 18)

        /// Настраиваем кнопку выбора Темной обжарки
        darkButton.frame = CGRect(x: 15, y: 102, width: 165, height: 165)
        darkButton.layer.cornerRadius = 12
        darkButton.backgroundColor = #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1)

        let imageDark = UIImage(named: "darkRoast")
        let imageDarkView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        imageDarkView.image = imageDark
        imageDarkView.contentMode = .scaleAspectFit

        let darkButtonTitle = UILabel(frame: CGRect(x: 0, y: 110, width: 165, height: 36))
        darkButtonTitle.font = UIFont(name: "Verdana", size: 14)
        darkButtonTitle.text = "Темная \nобжарка"
        darkButtonTitle.numberOfLines = 2
        darkButtonTitle.textAlignment = .center

        darkButton.addTarget(self, action: #selector(darkButtonTapped), for: .touchUpInside)

        darkButton.addSubview(imageDarkView)
        darkButton.addSubview(darkButtonTitle)

        /// Настраиваем кнопку выбора Светлой обжарки
        lightButton.frame = CGRect(x: 195, y: 102, width: 165, height: 165)
        lightButton.layer.cornerRadius = 12
        lightButton.backgroundColor = #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1)

        let imageLight = UIImage(named: "lightRoast")
        let imageLightView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        imageLightView.image = imageLight
        imageLightView.contentMode = .scaleAspectFit

        let lightButtonTitle = UILabel(frame: CGRect(x: 0, y: 110, width: 165, height: 36))
        lightButtonTitle.font = UIFont(name: "Verdana", size: 14)
        lightButtonTitle.text = "Светлая \nобжарка"
        lightButtonTitle.numberOfLines = 2
        lightButtonTitle.textAlignment = .center

        lightButton.addTarget(self, action: #selector(lightButtonTapped), for: .touchUpInside)

        lightButton.addSubview(imageLightView)
        lightButton.addSubview(lightButtonTitle)
    }

    private func addViews() {
        view.backgroundColor = .white
        view.addSubview(clarificationLabel)
        view.addSubview(darkButton)
        view.addSubview(lightButton)
    }

    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func darkButtonTapped() {
        print("dark pressed")
        guard let firstViewController = firstViewController else { return }
        firstViewController.setupRoastButton(roast: .dark)
        print("dark guard passed", firstViewController)
        dismiss(animated: true, completion: nil)
    }

    @objc private func lightButtonTapped() {
        guard let firstViewController = firstViewController else { return }
        firstViewController.setupRoastButton(roast: .light)
        print("light pressed", firstViewController)
        dismiss(animated: true, completion: nil)
    }
}
