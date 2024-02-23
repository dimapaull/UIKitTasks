// ProfileStoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol Storybale: AnyObject {
    /// Открытие истории во весь экран
    func openFullStory(imageName: UIImage)
}

/// Ячейка со скролом историй
final class ProfileStoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let storyWidth: CGFloat = 82
    }

    // MARK: - Visual Components

    let stroriesScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Private Properties

    weak var delegate: Storybale?

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

    func configure(stories: [ProfileStories]) {
        configureScrollView(storiesCount: stories.count)
        createStory(stories)
    }

    // MARK: - Private Methods

    private func configureScrollView(storiesCount: Int) {
        stroriesScrollView.contentSize.width = (Constants.storyWidth) * CGFloat(storiesCount)
        stroriesScrollView.showsVerticalScrollIndicator = false
        stroriesScrollView.showsHorizontalScrollIndicator = false
    }

    private func configureUI() {
        contentView.addSubview(stroriesScrollView)
        stroriesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stroriesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stroriesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stroriesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

    private func createStory(_ stories: [ProfileStories]) {
        var leadingAnchor = stroriesScrollView.leadingAnchor

        for story in stories {
            let storyNameLabel = UILabel()
            storyNameLabel.text = story.name
            storyNameLabel.textColor = .black
            storyNameLabel.textAlignment = .center
            storyNameLabel.font = UIFont().verdana(ofSize: 10)
            storyNameLabel.translatesAutoresizingMaskIntoConstraints = false

            let storyImageView = UIButton()
            storyImageView.addTarget(self, action: #selector(openStory), for: .touchUpInside)
            storyImageView.setImage(UIImage(named: story.imageName), for: .normal)

            storyImageView.layer.cornerRadius = storyImageView.bounds.height / 2
            storyImageView.clipsToBounds = true
            storyImageView.translatesAutoresizingMaskIntoConstraints = false
            addLayerFor(storyImageView)

            stroriesScrollView.addSubview(storyNameLabel)
            stroriesScrollView.addSubview(storyImageView)

            storyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
            storyImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            storyImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            storyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
                .isActive = true

            storyNameLabel.topAnchor.constraint(equalTo: storyImageView.bottomAnchor, constant: 4).isActive = true
            storyNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
            storyNameLabel.widthAnchor.constraint(equalToConstant: 55).isActive = true
            storyNameLabel.centerXAnchor.constraint(equalTo: storyImageView.centerXAnchor).isActive = true

            leadingAnchor = storyImageView.trailingAnchor
        }
    }

    private func addLayerFor(_ view: UIView) {
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 60, height: 60))
        borderLayer.borderColor = UIColor.appGray.cgColor
        borderLayer.borderWidth = 1
        borderLayer.cornerRadius = borderLayer.frame.width / 2
        view.layer.insertSublayer(borderLayer, above: view.layer)
    }

    @objc private func openStory(_ button: UIButton) {
        delegate?.openFullStory(imageName: button.currentImage ?? UIImage())
    }
}
