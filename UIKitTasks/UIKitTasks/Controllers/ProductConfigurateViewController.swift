// ProductConfigurateViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для модификации выбранного продукта
final class ProductConfigurateViewController: UIViewController {
    // MARK: - Private Properties

    private enum Roast {
        case dark
        case light
    }

    private let currentCoffeeImageView = UIImageView()
    private let coffeeImageBackgroundView = UIView()
    private let chooseCoffeeSegmentedControl = UISegmentedControl()
    private let modificationLabel = UILabel()

    private let roastButton = UIButton()
    private let additionalIngredientsButton = UIButton()

    private let priceLabel = UILabel()

    private let orderButton = UIButton()

    let coffeeTypes = ["Американо", "Капучино", "Латте"]

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCoffeeImageBackground()
        setupNavigationBar()

        addViews()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false

        let backButton = UIButton(type: .system)
        backButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        backButton.backgroundColor = #colorLiteral(red: 0.920884192, green: 0.9655141234, blue: 0.9699655175, alpha: 1)
        backButton.layer.cornerRadius = 22
        backButton.setImage(UIImage(named: "leftArrow"), for: .normal)
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let shareButton = UIButton(type: .system)
        shareButton.frame = CGRect(x: 0, y: 0, width: 21, height: 21)
        shareButton.setImage(UIImage(named: "plane"), for: .normal)
        shareButton.tintColor = .black
        shareButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        let shareButtonItem = UIBarButtonItem(customView: shareButton)

        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.rightBarButtonItem = shareButtonItem
    }

    private func setupCoffeeImageBackground() {
        coffeeImageBackgroundView.backgroundColor = #colorLiteral(red: 0.9407027364, green: 0.8816927075, blue: 0.8163741231, alpha: 1)
        coffeeImageBackgroundView.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        coffeeImageBackgroundView.layer.cornerRadius = 12
        coffeeImageBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    private func addViews() {
        view.addSubview(coffeeImageBackgroundView)
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func shareButtonPressed() {
        print("Share with friend")
    }
}
