// PhotosTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка содержащая в себе коллекцию постов с фотографиями
final class PhotosTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let countOfColumns = 3.02
    }

    // MARK: - Visual Components

    private lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        layout.itemSize = .init(
            width: Int(UIScreen.main.bounds.width / Constants.countOfColumns),
            height: Int(UIScreen.main.bounds.width / Constants.countOfColumns)
        )

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Pivate Properties

    private var photoNames: [String] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    // MARK: - Public Methods

    func configure(posts: [String]) {
        photoNames = posts
    }

    // MARK: - Private Methods

    private func configureUI() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.register(
            PhotoCollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self)
        )

        contentView.addSubview(collectionView)

        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 700).isActive = true
    }
}

// MARK: - PhotosTableViewCell + UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoNames.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath
            ) as? PhotoCollectionViewCell
        else { return UICollectionViewCell() }
        cell.setupImage(postName: photoNames[indexPath.item])
        return cell
    }
}
