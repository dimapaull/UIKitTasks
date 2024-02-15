// CatalogItem.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стандартная вью в каталоге
final class CatalogItem: UIView {
    // MARK: - Visual Components

    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Life Cycle

    init(frame: CGRect, name: String, image: UIImage) {
        super.init(frame: .zero)
        mainImageView.image = image
        nameLabel.text = name
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Public Methods

    func setTitle(_ title: String?) {
        nameLabel.text = title
    }

    func setImage(_ image: UIImage?) {
        mainImageView.image = image
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubview(nameLabel)
        addSubview(mainImageView)
        addAnchors()
    }

    private func addAnchors() {
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        nameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
