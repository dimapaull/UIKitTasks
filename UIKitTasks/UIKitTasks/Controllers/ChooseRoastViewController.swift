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

        darkButton.setTitle("Темная обжарка", for: .normal)
        darkButton.setTitleColor(.black, for: .normal)
        darkButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        darkButton.titleLabel?.numberOfLines = 2
        darkButton.titleLabel?.textAlignment = .center

        // Размещение надписи под кнопкой
        darkButton.titleEdgeInsets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

        darkButton.addTarget(self, action: #selector(darkButtonTapped), for: .touchUpInside)

        darkButton.addSubview(imageDarkView)

        /// Настраиваем кнопку выбора Светлой обжарки
        lightButton.frame = CGRect(x: 195, y: 102, width: 165, height: 165)
        lightButton.layer.cornerRadius = 12
        lightButton.backgroundColor = #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1)

        let imageLight = UIImage(named: "lightRoast")
        let imageLightView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        imageLightView.image = imageLight
        imageLightView.contentMode = .scaleAspectFit

        lightButton.setTitle("Светлая обжарка", for: .normal)
        lightButton.setTitleColor(.black, for: .normal)
        lightButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        lightButton.titleLabel?.numberOfLines = 2
        lightButton.titleLabel?.textAlignment = .center

        // Размещение надписи под кнопкой
        lightButton.titleEdgeInsets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

        lightButton.addTarget(self, action: #selector(lightButtonTapped), for: .touchUpInside)

        lightButton.addSubview(imageLightView)
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
