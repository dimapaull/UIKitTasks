// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для предоставления каталога одежды
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let controllerTitle = "Каталог"
        static let manSegmentText = "Мужчинам"
        static let womanSegmentText = "Женщинам"
        static let kidSegmentText = "Детям"
        static let newsText = "Новинки"
        static let saleText = "Распродажа"
        static let menuBrandsText = "Бренды"
        static let menuShoesText = "Обувь"
        static let menuBagsText = "Сумки"
        static let startYPoint: CGFloat = 326
        static let marginMenuItems: CGFloat = 100
    }

    // MARK: - Visual Components

    private let newsImageView = {
        let imageView = UIImageView(image: .manNews)
        imageView.layer.cornerRadius = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addShadow()
        return imageView
    }()

    private let newsLabel = {
        let label = UILabel()
        label.text = Constants.newsText
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let saleImageView = {
        let imageView = UIImageView(image: .manSales)
        imageView.layer.cornerRadius = 12
        imageView.addShadow()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let saleLabel = {
        let label = UILabel()
        label.text = Constants.saleText
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var chapterSegmentControl = {
        let segmentControl = UISegmentedControl(items: [
            Constants.womanSegmentText,
            Constants.manSegmentText,
            Constants.kidSegmentText
        ])
        segmentControl.selectedSegmentIndex = 1
        segmentControl.addTarget(self, action: #selector(switchCapterList), for: .valueChanged)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentControl
    }()

    private let menuItems = [
        CatalogItem(frame: .zero, name: Constants.menuBrandsText, image: .brands),
        CatalogItem(frame: .zero, name: Constants.menuShoesText, image: .shoesMan),
        CatalogItem(frame: .zero, name: Constants.menuBagsText, image: .bagMan)
    ]

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigionBar()
        setupTabBarItem()
        addSubviewsInMainView()
        configureUI()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        addAnchorsChapterSegment()
        addAnchorsNewsImage()
        addAnchorsSaleImage()
        addAnchorsSaleLabel()
        addAnchorsNewsLabel()

        setupCatalogItemView()
    }

    private func addSubviewsInMainView() {
        view.addSubview(chapterSegmentControl)
        view.addSubview(saleImageView)
        view.addSubview(newsImageView)

        saleImageView.addSubview(saleLabel)
        newsImageView.addSubview(newsLabel)
    }

    private func addAnchorsChapterSegment() {
        chapterSegmentControl.widthAnchor.constraint(equalToConstant: 345).isActive = true
        chapterSegmentControl.heightAnchor.constraint(equalToConstant: 44).isActive = true
        chapterSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        chapterSegmentControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 122).isActive = true
    }

    private func addAnchorsNewsImage() {
        newsImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        newsImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        newsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
    }

    private func addAnchorsSaleImage() {
        saleImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        saleImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        saleImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        saleImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
    }

    private func addAnchorsSaleLabel() {
        saleLabel.widthAnchor.constraint(equalTo: saleImageView.widthAnchor).isActive = true
        saleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        saleLabel.centerXAnchor.constraint(equalTo: saleImageView.centerXAnchor).isActive = true
        saleLabel.bottomAnchor.constraint(equalTo: saleImageView.bottomAnchor).isActive = true
    }

    private func addAnchorsNewsLabel() {
        newsLabel.widthAnchor.constraint(equalTo: newsImageView.widthAnchor).isActive = true
        newsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        newsLabel.centerXAnchor.constraint(equalTo: newsImageView.centerXAnchor).isActive = true
        newsLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor).isActive = true
    }

    private func setupNavigionBar() {
        title = Constants.controllerTitle
        navigationItem.titleView?.tintColor = .black

        let cameraBarItem = UIBarButtonItem(image: .catalogCamera, style: .plain, target: nil, action: nil)
        cameraBarItem.tintColor = .black
        let qrCodeBarItem = UIBarButtonItem(image: .catalogQrCode, style: .plain, target: nil, action: nil)
        qrCodeBarItem.tintColor = .black
        navigationItem.rightBarButtonItems = [qrCodeBarItem, cameraBarItem]
    }

    private func setupCatalogItemView() {
        var startY = Constants.startYPoint

        for item in menuItems {
            item.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(item)

            NSLayoutConstraint.activate([
                item.widthAnchor.constraint(equalToConstant: 335),
                item.heightAnchor.constraint(equalToConstant: 80),
                item.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                item.topAnchor.constraint(equalTo: view.topAnchor, constant: startY),
            ])
            startY += Constants.marginMenuItems
        }

        let tapRecorder = UITapGestureRecognizer(target: self, action: #selector(showDetailSectionViewController))
        menuItems[1].addGestureRecognizer(tapRecorder)
    }

    private func setupTabBarItem() {
        let catalogTabBarItem = UITabBarItem(title: Constants.controllerTitle, image: .toolBarCatalog, tag: 0)

        tabBarItem = catalogTabBarItem
    }

    @objc private func switchCapterList(_ segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            menuItems[1].setImage(.womanShoes)
            menuItems[2].setImage(.womanBag)
            newsImageView.image = .womanNews
            saleImageView.image = .womanSale
        case 1:
            menuItems[1].setImage(.shoesMan)
            menuItems[2].setImage(.bagMan)
            newsImageView.image = .manNews
            saleImageView.image = .manSales
        case 2:
            menuItems[1].setImage(.kidShoes)
            menuItems[2].setImage(.kidBag)
            newsImageView.image = .kidNews
            saleImageView.image = .kidSale
        default:
            break
        }
    }

    @objc private func showDetailSectionViewController() {
        if chapterSegmentControl.selectedSegmentIndex == 0 {
            let detailSectionViewController = DetailSectionViewController()
            navigationController?.pushViewController(detailSectionViewController, animated: true)
        }
    }
}
