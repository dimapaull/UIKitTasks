// ProductConfigurateViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для модификации выбранного продукта
final class ProductConfigurateViewController: UIViewController {
    // MARK: - Public Properties

    var basePrice = 0
    var additionalPrice = 0
    var totalPrice = 0

    enum Roast {
        case dark
        case light
    }

    enum AdditionalIngredientsStatus {
        case add
        case added
    }

    // MARK: - Private Properties

    private let currentCoffeeImageView = UIImageView()
    private let coffeeImageBackgroundView = UIView()

    var selectedCoffeeName = ""
    private var chooseCoffeeSegmentedControl = UISegmentedControl()
    private let modificationLabel = UILabel()

    private let roastButton = UIButton()
    private let additionalIngredientsButton = UIButton()

    private let totalPriceLabel = UILabel()

    private let orderButton = UIButton()

    let coffeeTypes = ["Американо", "Капучино", "Латте"]
    let coffeePrices = [100, 120, 150]
    let coffeeImages = [
        UIImage(named: "coffeeAmericano"),
        UIImage(named: "coffeeCapuchino"),
        UIImage(named: "coffeeLatte")
    ]

    // MARK: - Overrides Methods (View Life Cycles)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()

        setupCoffeeImageBackground()
        setupCurrentCoffeeImageView()
        setupSegmentedControl()
        setupModificationLabel()
        setupRoastButton(roast: .light)
        setupAdditionalIngredientsButton(status: .added)
        setupTotalPriceLabel()
        setupOrderButton()

        addViews()
    }

    /// Настройка панели навигации
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
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)

        let backBarButtonItem = UIBarButtonItem(customView: backButton)
        let shareButtonItem = UIBarButtonItem(customView: shareButton)

        navigationItem.leftBarButtonItem = backBarButtonItem
        navigationItem.rightBarButtonItem = shareButtonItem
    }

    /// Настройка фона изображения кофе
    private func setupCoffeeImageBackground() {
        coffeeImageBackgroundView.backgroundColor = #colorLiteral(red: 0.9407027364, green: 0.8816927075, blue: 0.8163741231, alpha: 1)
        coffeeImageBackgroundView.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        coffeeImageBackgroundView.layer.cornerRadius = 12
        coffeeImageBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    /// Настройка изображения кофе
    private func setupCurrentCoffeeImageView() {
        currentCoffeeImageView.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        currentCoffeeImageView.image = coffeeImages[0]
    }

    /// Настройка Segmented Control
    private func setupSegmentedControl() {
        chooseCoffeeSegmentedControl = UISegmentedControl(items: coffeeTypes)
        chooseCoffeeSegmentedControl.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        chooseCoffeeSegmentedControl.addTarget(self, action: #selector(selectedCoffee), for: .valueChanged)
        chooseCoffeeSegmentedControl.selectedSegmentIndex = 0
    }

    /// Настройка лейбла "Модификация"
    private func setupModificationLabel() {
        modificationLabel.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        modificationLabel.text = "Модификация"
        modificationLabel.font = UIFont(name: "Verdana-Bold", size: 18)
    }

    /// Настройка кнопки выбора обжарки
    func setupRoastButton(roast: Roast) {
        roastButton.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        roastButton.layer.cornerRadius = 12
        roastButton.backgroundColor = #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1)

        var image: UIImage?

        switch roast {
        case .dark:
            roastButton.setTitle("Темная обжарка", for: .normal)
            image = UIImage(named: "darkRoast")
        case .light:
            roastButton.setTitle("Светлая обжарка", for: .normal)
            image = UIImage(named: "lightRoast")
        }

        let imageView = UIImageView(frame: CGRect(x: 31, y: 17, width: 100, height: 100))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        roastButton.setTitleColor(.black, for: .normal)
        roastButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        roastButton.titleLabel?.numberOfLines = 2
        roastButton.titleLabel?.textAlignment = .center

        // Размещение надписи под кнопкой
        roastButton.titleEdgeInsets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

        roastButton.addTarget(self, action: #selector(roastButtonTapped), for: .touchUpInside)

        roastButton.addSubview(imageView)
    }

    /// Настройка кнопки выбора дополнительных ингредиентов
    func setupAdditionalIngredientsButton(status: AdditionalIngredientsStatus) {
        additionalIngredientsButton.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
        additionalIngredientsButton.layer.cornerRadius = 12
        additionalIngredientsButton.backgroundColor = #colorLiteral(red: 0.9694761634, green: 0.9694761634, blue: 0.9694761634, alpha: 1)

        var image: UIImage?
        var imageView = UIImageView()

        switch status {
        case .add:
            image = UIImage(named: "addCross")
            imageView = UIImageView(frame: CGRect(x: 67, y: 56, width: 30, height: 30))
        case .added:
            image = UIImage(named: "customCheckmark")
            imageView = UIImageView(frame: CGRect(x: 57, y: 46, width: 50, height: 50))
        }

        additionalIngredientsButton.setTitle("Дополнительные ингредiенты", for: .normal)

        imageView.image = image
        imageView.contentMode = .scaleAspectFit

        additionalIngredientsButton.setTitleColor(.black, for: .normal)
        additionalIngredientsButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        additionalIngredientsButton.titleLabel?.numberOfLines = 2
        additionalIngredientsButton.titleLabel?.textAlignment = .center

        // Размещение надписи под кнопкой
        additionalIngredientsButton.titleEdgeInsets = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)

        additionalIngredientsButton.addTarget(
            self,
            action: #selector(additionalIngredientsButtonTapped),
            for: .touchUpInside
        )

        additionalIngredientsButton.addSubview(imageView)
    }

    /// Настройка лейбла цены
    private func setupTotalPriceLabel() {
        totalPriceLabel.text = "Цѣна \(coffeePrices[0])"
        totalPriceLabel.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        totalPriceLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        totalPriceLabel.textAlignment = .right
    }

    private func setupOrderButton() {
        orderButton.setTitle("Заказать", for: .normal)
        orderButton.setTitleColor(.white, for: .normal)
        orderButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        orderButton.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        orderButton.layer.cornerRadius = 12
        orderButton.backgroundColor = #colorLiteral(red: 0.3492000699, green: 0.7459038496, blue: 0.7814769149, alpha: 1)
        orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .touchUpInside)
    }

    private func addViews() {
        view.addSubview(coffeeImageBackgroundView)
        coffeeImageBackgroundView.addSubview(currentCoffeeImageView)

        view.addSubview(currentCoffeeImageView)
        view.addSubview(chooseCoffeeSegmentedControl)
        view.addSubview(modificationLabel)
        view.addSubview(roastButton)
        view.addSubview(additionalIngredientsButton)
        view.addSubview(totalPriceLabel)
        view.addSubview(orderButton)
    }

    private func updateTotalPrice() {
        totalPrice = basePrice + additionalPrice
        totalPriceLabel.text = "Цѣна \(totalPrice)"
    }

    // обработка изменений выбора кофе
    @objc func selectedCoffee(target: UISegmentedControl) {
        if target.isEqual(chooseCoffeeSegmentedControl) {
            let segmentIndex = target.selectedSegmentIndex
            currentCoffeeImageView.image = coffeeImages[segmentIndex]
            basePrice = coffeePrices[segmentIndex]
            selectedCoffeeName = target.titleForSegment(at: segmentIndex) ?? ""
            updateTotalPrice()
            print(selectedCoffeeName)
            print(basePrice)
        }
    }

    @objc private func roastButtonTapped() {
        // Обработка нажатия на кнопку
        print("Roast Button tapped!")

        let secondVC = ChooseRoastViewController()
        secondVC.firstViewController = self // передаем ссылку на первый экран
        let navigtionController = UINavigationController(rootViewController: secondVC)

        navigtionController.modalPresentationStyle = .formSheet
        present(navigtionController, animated: true, completion: nil)
    }

    @objc func additionalIngredientsButtonTapped() {
        // Обработка нажатия на кнопку
        print("Ingredients Button tapped!")
    }

    @objc private func backButtonTapped() {
        print("Back Button tapped!")
        navigationController?.popViewController(animated: true)
    }

    @objc private func orderButtonTapped() {
        print("Order Button tapped!")
    }

    @objc private func shareButtonTapped() {
        print("Share with friend")
    }
}
