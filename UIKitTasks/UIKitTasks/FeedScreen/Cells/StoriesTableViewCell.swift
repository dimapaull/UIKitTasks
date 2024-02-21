// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для сторис
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let plusSymbol = "+"
        static let storyWidth: CGFloat = 82
    }

    // MARK: - Visual Components

    private lazy var addStoryButton = {
        let button = UIButton()
        button.setTitle(Constants.plusSymbol, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appPink
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let stroriesScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupAnchors()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(stories: [Stories]) {
        configureUI(storiesCount: stories.count)
        createStory(stories)
    }

    // MARK: - Private Methods

    private func configureUI(storiesCount: Int) {
        stroriesScrollView.contentSize.width = (Constants.storyWidth) * CGFloat(storiesCount)
        stroriesScrollView.showsVerticalScrollIndicator = false
        stroriesScrollView.showsHorizontalScrollIndicator = false
    }

    private func setupAnchors() {
        contentView.addSubview(stroriesScrollView)

        NSLayoutConstraint.activate([
            stroriesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stroriesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stroriesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stroriesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    private func createStory(_ stories: [Stories]) {
        var leadingAnchor = stroriesScrollView.leadingAnchor

        for story in stories {
            let userNamelabel = UILabel()
            userNamelabel.text = story.userName
            userNamelabel.textColor = .black
            userNamelabel.textAlignment = .center
            userNamelabel.font = UIFont().verdana(ofSize: 10)
            userNamelabel.translatesAutoresizingMaskIntoConstraints = false

            let avatarImageView = UIImageView()
            avatarImageView.image = UIImage(named: story.imageName)
            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.layer.cornerRadius = 30
            avatarImageView.clipsToBounds = true
            avatarImageView.translatesAutoresizingMaskIntoConstraints = false

            stroriesScrollView.addSubview(userNamelabel)
            stroriesScrollView.addSubview(avatarImageView)

            if story.isSelfStory {
                userNamelabel.textColor = .appGray
                stroriesScrollView.addSubview(addStoryButton)

                NSLayoutConstraint.activate([
                    addStoryButton.heightAnchor.constraint(equalToConstant: 20),
                    addStoryButton.widthAnchor.constraint(equalToConstant: 20),
                    addStoryButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
                    addStoryButton.rightAnchor.constraint(equalTo: avatarImageView.rightAnchor),
                ])
            }

            NSLayoutConstraint.activate([
                avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                avatarImageView.heightAnchor.constraint(equalToConstant: 60),
                avatarImageView.widthAnchor.constraint(equalToConstant: 60),
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: story.isSelfStory ? 12 : 22),

                userNamelabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4),
                userNamelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                userNamelabel.widthAnchor.constraint(equalToConstant: 74),
                userNamelabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            ])
            leadingAnchor = avatarImageView.trailingAnchor
        }
    }
}
