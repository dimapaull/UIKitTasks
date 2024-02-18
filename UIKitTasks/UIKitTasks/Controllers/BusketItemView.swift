// BusketItemView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ItemDeletable: AnyObject {
    func deleteItem(index: Int)
}

/// Вью для корзины
final class BusketItemView: UIView {
    // MARK: - Constants

    enum Constants {
        static let nameItemText = "Женские ботинки"
        static let countItemText = "Количество"
        static let sizeItemText = "Размер"
        static let priceItemText = "Цена"
        static let plusSymbol = "+"
        static let discradSymbol = "-"
        static let currencySymbol = "₽"
    }

    // MARK: - Visual Components

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.nameItemText
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.countItemText
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "\(1)"
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let sizeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.sizeItemText
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.priceItemText
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var discardCountButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.discradSymbol, for: .normal)
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .appSoftGray
        button.setTitleColor(.black, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didChangeCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var addCountButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.plusSymbol, for: .normal)
        button.layer.cornerRadius = 7.5
        button.backgroundColor = .appSoftGray
        button.setTitleColor(.black, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didChangeCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var removeCartButton: UIButton = {
        let button = UIButton()
        button.setImage(.removeCart, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didRemoveCartPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let sizes = Array(35 ... 39)
    private var countItems = 1
    private var sizeButtons: [UIButton] = []
    private var currentSize = Int()
    weak var delegate: ItemDeletable?

    // MARK: - Life Cycle

    init(frame: CGRect, item: OrderItem, image: UIImage, size: Int, tag: Int) {
        super.init(frame: .zero)
        removeCartButton.tag = tag
        mainImageView.image = image
        currentSize = item.size ?? 0
        priceLabel.text = "\(item.price) \(Constants.currencySymbol)"
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Public Methods

    func setTitle(_ title: String?) {
        priceLabel.text = title
    }

    func setImage(_ image: UIImage?) {
        mainImageView.image = image
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubviewsInMainView()
        addAnchors()
        createSizeButtons()
    }

    private func createSizeButtons() {
        var startX: CGFloat = -28
        for size in sizes {
            let sizeButton = UIButton()
            sizeButton.setTitle("\(size)", for: .normal)
            sizeButton.setTitleColor(.black, for: .normal)
            sizeButton.layer.cornerRadius = 8.5
            sizeButton.titleLabel?.font = .systemFont(ofSize: 10)
            sizeButton.layer.borderColor = UIColor.appPink.cgColor
            sizeButton.backgroundColor = .appSoftGray
            sizeButton.translatesAutoresizingMaskIntoConstraints = false
            sizeButton.addTarget(self, action: #selector(didSizeChanged), for: .touchUpInside)

            if size == currentSize {
                sizeButton.layer.borderWidth = 1
            }

            addSubview(sizeButton)

            if size == sizes.last {
                startX = 6
            } else {
                startX += 34
            }

            NSLayoutConstraint.activate([
                sizeButton.leftAnchor.constraint(equalTo: sizeTitleLabel.leftAnchor, constant: startX),
                sizeButton.topAnchor.constraint(
                    equalTo: sizeTitleLabel.bottomAnchor,
                    constant: size == sizes.last ? 34 : 10
                ),
                sizeButton.widthAnchor.constraint(equalToConstant: 31),
                sizeButton.heightAnchor.constraint(equalToConstant: 17)
            ])
            sizeButtons.append(sizeButton)
        }
    }

    private func addSubviewsInMainView() {
        addSubview(mainImageView)
        addSubview(itemNameLabel)
        addSubview(sizeTitleLabel)
        addSubview(countTitleLabel)
        addSubview(countLabel)
        addSubview(addCountButton)
        addSubview(discardCountButton)
        addSubview(priceTitleLabel)
        addSubview(priceLabel)
        addSubview(removeCartButton)
    }

    private func addAnchors() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 48),
            mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            removeCartButton.heightAnchor.constraint(equalToConstant: 20),
            removeCartButton.widthAnchor.constraint(equalToConstant: 20),
            removeCartButton.leftAnchor.constraint(equalTo: mainImageView.rightAnchor),
            removeCartButton.bottomAnchor.constraint(equalTo: mainImageView.topAnchor),

            itemNameLabel.heightAnchor.constraint(equalToConstant: 15),
            itemNameLabel.widthAnchor.constraint(equalToConstant: 110),
            itemNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            itemNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -72),

            countTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            countTitleLabel.widthAnchor.constraint(equalToConstant: 72),
            countTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            countTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),

            addCountButton.heightAnchor.constraint(equalToConstant: 15),
            addCountButton.widthAnchor.constraint(equalToConstant: 15),
            addCountButton.centerYAnchor.constraint(equalTo: countTitleLabel.centerYAnchor),
            addCountButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -27),

            countLabel.heightAnchor.constraint(equalToConstant: 17),
            countLabel.widthAnchor.constraint(equalToConstant: 15),
            countLabel.centerYAnchor.constraint(equalTo: countTitleLabel.centerYAnchor),
            countLabel.rightAnchor.constraint(equalTo: addCountButton.leftAnchor, constant: -3),

            discardCountButton.heightAnchor.constraint(equalToConstant: 15),
            discardCountButton.widthAnchor.constraint(equalToConstant: 15),
            discardCountButton.centerYAnchor.constraint(equalTo: countTitleLabel.centerYAnchor),
            discardCountButton.rightAnchor.constraint(equalTo: countLabel.leftAnchor, constant: -3),

            sizeTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            sizeTitleLabel.widthAnchor.constraint(equalToConstant: 50),
            sizeTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 72),
            sizeTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),

            priceTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            priceTitleLabel.widthAnchor.constraint(equalToConstant: 32),
            priceTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 142),
            priceTitleLabel.leftAnchor.constraint(equalTo: itemNameLabel.leftAnchor),

            priceLabel.heightAnchor.constraint(equalToConstant: 12),
            priceLabel.widthAnchor.constraint(equalToConstant: 63),
            priceLabel.centerYAnchor.constraint(equalTo: priceTitleLabel.centerYAnchor),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }

    @objc private func didSizeChanged(_ button: UIButton) {
        for sizeButton in sizeButtons {
            if button == sizeButton {
                sizeButton.layer.borderWidth = 1
            } else {
                sizeButton.layer.borderWidth = 0
            }
        }
    }

    @objc private func didChangeCount(_ button: UIButton) {
        switch button {
        case addCountButton where countItems < 20:
            countItems += 1
            countLabel.text = "\(countItems)"
        case discardCountButton where countItems > 1:
            countItems -= 1
            countLabel.text = "\(countItems)"
        default:
            break
        }
    }

    @objc private func didRemoveCartPressed(_ button: UIButton) {
        delegate?.deleteItem(index: button.tag)
    }
}
