// ProductView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Отвечает за действия, которые совершает пользователь во вью
protocol ProductViewDelegate: AnyObject {
    /// Метод, вызывающийся при нажатии на корзину
    func didPressedBag()
}

/// Стандартная вью продукта
final class ProductView: UIView {
    // MARK: - Visual Components

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var addCartButton: UIButton = {
        let button = UIButton()
        button.setImage(.sizeIcon, for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didAddCartPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    weak var delegate: ProductViewDelegate?

    // MARK: - Life Cycle

    init(frame: CGRect, price: String, image: UIImage) {
        super.init(frame: .zero)
        mainImageView.image = image
        priceLabel.text = price
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Public Methods

    func setPrice(_ price: String?) {
        priceLabel.text = price
    }

    func setImage(_ image: UIImage?) {
        mainImageView.image = image
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubview(priceLabel)
        addSubview(mainImageView)
        addSubview(addCartButton)
        addAnchors()
    }

    private func addAnchors() {
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor),

            addCartButton.heightAnchor.constraint(equalToConstant: 24),
            addCartButton.widthAnchor.constraint(equalToConstant: 24),
            addCartButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 9),
            addCartButton.topAnchor.constraint(equalTo: topAnchor, constant: 9),

            priceLabel.heightAnchor.constraint(equalToConstant: 12),
            priceLabel.widthAnchor.constraint(equalToConstant: 63),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 9),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12)
        ])
    }

    @objc private func didAddCartPressed() {
        delegate?.didPressedBag()
    }
}
