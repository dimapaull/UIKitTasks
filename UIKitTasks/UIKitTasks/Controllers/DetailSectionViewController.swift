// DetailSectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер, отображающий детальную информацию выбранного раздела
final class DetailSectionViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    private enum Constants {
        static let controllerTitle = "Обувь"
        static let startYPoint: CGFloat = 130
        static let marginProductItems: CGFloat = 173
        static let currencySimbol = "₽"
        static let widthViewAndOffset: CGFloat = 193
    }

    // MARK: - Visual Components

    private var productViewItems = [
        ProductView(
            frame: .zero,
            order: OrderItem(price: 2250),
            image: .womanDetailBlackShoes,
            tag: 0
        ),
        ProductView(
            frame: .zero,
            order: OrderItem(price: 4250),
            image: .womanDetailBlackBoots,
            tag: 1
        ),
        ProductView(
            frame: .zero,
            order: OrderItem(price: 5750),
            image: .womanDetailPinkShoes,
            tag: 2
        ),
        ProductView(
            frame: .zero,
            order: OrderItem(price: 3500),
            image: .womanDetailYellowShoes,
            tag: 3
        ),
        ProductView(
            frame: .zero,
            order: OrderItem(price: 5750),
            image: .womanDetailWhiteSneakers,
            tag: 4
        )
    ]

    // MARK: - Private Properties

    private var products = [
        OrderItem(price: 2250),
        OrderItem(price: 4250),
        OrderItem(price: 5750),
        OrderItem(price: 3500),
        OrderItem(price: 5750)
    ]

    private let produtsImages: [UIImage] = [
        .womanDetailBlackShoes,
        .womanDetailBlackBoots,
        .womanDetailPinkShoes,
        .womanDetailYellowShoes,
        .womanDetailWhiteSneakers,
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupNavigionBar()
        setupProductItemViews()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
    }

    private func setupProductItemViews() {
        var startY = Constants.startYPoint
        var isLeftLocation = true

        for (index, item) in productViewItems.enumerated() {
            item.delegate = self
            item.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(item)

            NSLayoutConstraint.activate([
                item.widthAnchor.constraint(equalToConstant: 157),
                item.heightAnchor.constraint(equalToConstant: 157),
                item.leftAnchor.constraint(
                    equalTo: isLeftLocation ? view.leftAnchor : view.rightAnchor,
                    constant: isLeftLocation ? 20 : -Constants.widthViewAndOffset
                ),
                item.topAnchor.constraint(equalTo: view.topAnchor, constant: startY),
            ])

            if index % 2 != 0, !isLeftLocation {
                startY += Constants.marginProductItems
            }
            isLeftLocation.toggle()
        }
    }

    private func setupNavigionBar() {
        title = Constants.controllerTitle
        navigationItem.titleView?.tintColor = .black

        let backBarItem = UIBarButtonItem(image: .backBarItem, style: .plain, target: nil, action: nil)
        backBarItem.tintColor = .black

        navigationItem.leftBarButtonItem = backBarItem
    }
}

extension DetailSectionViewController: ProductViewDelegate {
    func didPressedBag(tag: Int) {
        let chooseSizeViewController = ChooseSizeViewController()
        chooseSizeViewController.delegate = self
        chooseSizeViewController.tag = tag
        let navigationController = UINavigationController(rootViewController: chooseSizeViewController)
        present(navigationController, animated: true)
    }
}

extension DetailSectionViewController: Dissmisable {
    func didCloseController(size: Int, tag: Int) {
        guard let cartViewController = tabBarController?.viewControllers?[1] as? BasketViewController else { return }
        products[tag].size = size
        cartViewController.basketItems.append(products[tag])
        cartViewController.basketItemImages.append(produtsImages[tag])
    }
}
