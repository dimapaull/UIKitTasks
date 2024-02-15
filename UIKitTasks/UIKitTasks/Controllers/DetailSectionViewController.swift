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
        static let blackShoesPrice = 2250
        static let blackBotsPrice = 4250
        static let pinkSneakersPrice = 5750
        static let yellowShoesPrice = 3500
        static let whiteSneakersPrice = 5750
        static let currencySimbol = "₽"
        static let widthViewAndOffset: CGFloat = 193
    }

    // MARK: - Visual Components

    private var productViewItems = [
        ProductView(
            frame: .zero,
            price: "\(Constants.blackShoesPrice) \(Constants.currencySimbol)",
            image: .womanDetailBlackShoes
        ),
        ProductView(
            frame: .zero,
            price: "\(Constants.blackBotsPrice) \(Constants.currencySimbol)",
            image: .womanDetailBlackBoots
        ),
        ProductView(
            frame: .zero,
            price: "\(Constants.pinkSneakersPrice) \(Constants.currencySimbol)",
            image: .womanDetailPinkShoes
        ),
        ProductView(
            frame: .zero,
            price: "\(Constants.yellowShoesPrice) \(Constants.currencySimbol)",
            image: .womanDetailYellowShoes
        ),
        ProductView(
            frame: .zero,
            price: "\(Constants.whiteSneakersPrice) \(Constants.currencySimbol)",
            image: .womanDetailWhiteSneakers
        )
    ]

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupNavigionBar()
        setupProductItemViews()
    }

    // MARK: - Public Methods

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
    func didPressedBag() {
        let chooseSizeViewConreoller = ChooseSizeViewController()
        let navigationController = UINavigationController(rootViewController: chooseSizeViewConreoller)
        present(navigationController, animated: true)
    }
}
