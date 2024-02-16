// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер предоставляющий информацию о товарах, находящихся в корзине
final class BasketViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let controllerTitle = "Корзина"
        static let checkoutButtonText = "Оформить заказ -"
        static let currencySymbol = "₽"
        static let startY: CGFloat = 116
        static let itemMargin: CGFloat = 150
    }

    // MARK: - Visual Components

    private let controllerTitleLabel = {
        let label = UILabel()
        label.text = Constants.controllerTitle
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let checkoutButton = {
        let button = UIButton()
        button.setTitle(Constants.checkoutButtonText, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appPink
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadow()
        return button
    }()

    // MARK: - Public Properties

    var basketItems: [OrderItem] = []
    var basketItemImages: [UIImage] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configurateUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configurateUI()
    }

    // MARK: - Public Methods

    func setupTabBarItem() {
        tabBarItem.title = Constants.controllerTitle
        let catalogTabBarItem = UITabBarItem(title: Constants.controllerTitle, image: .toolBarBag, tag: 0)
        tabBarItem = catalogTabBarItem
    }

    // MARK: - Private Methods

    private func configurateUI() {
        loadView()
        view.backgroundColor = .white
        checkoutButton.setTitle(
            "\(Constants.checkoutButtonText) \(mathCount()) \(Constants.currencySymbol)",
            for: .normal
        )
        addSubviewsInMainView()
        addCheckoutButtonAnchors()
        addBasketItemViews()
    }

    private func addSubviewsInMainView() {
        view.addSubview(checkoutButton)
        view.addSubview(controllerTitleLabel)
    }

    private func addBasketItemViews() {
        var startY: CGFloat = Constants.startY
        for (index, item) in basketItems.enumerated() {
            let busketItemView = BusketItemView(
                frame: .zero,
                item: item,
                image: basketItemImages[index],
                size: item.size ?? 0,
                tag: index
            )
            busketItemView.delegate = self
            busketItemView.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(busketItemView)

            NSLayoutConstraint.activate([
                busketItemView.widthAnchor.constraint(equalTo: view.widthAnchor),
                busketItemView.heightAnchor.constraint(equalToConstant: 157),
                busketItemView.topAnchor.constraint(equalTo: view.topAnchor, constant: startY),
            ])
            startY += Constants.itemMargin
        }
    }

    private func mathCount() -> Int {
        basketItems.reduce(0) { $0 + $1.price }
    }

    private func addCheckoutButtonAnchors() {
        NSLayoutConstraint.activate([
            checkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkoutButton.heightAnchor.constraint(equalToConstant: 44),
            checkoutButton.widthAnchor.constraint(equalToConstant: 335),
            checkoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -114),

            controllerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            controllerTitleLabel.heightAnchor.constraint(equalToConstant: 44),
            controllerTitleLabel.widthAnchor.constraint(equalToConstant: 115),
            controllerTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
        ])
    }
}

/// Расширение, реализующее проктолом передачи данных при выхода из контроллера
extension BasketViewController: ItemDeletable {
    func deleteItem(index: Int) {
        basketItems.remove(at: index)
        loadView()
        configurateUI()
    }
}
