// StoriesTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для сторис
final class StoriesTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let plusSymbol = "+"
        static let storyWidth: CGFloat = 82
        static let cornerRadiusAddButton: CGFloat = 10
    }

    // MARK: - Visual Components

    private lazy var addStoryButton = {
        let button = UIButton()
        button.setTitle(Constants.plusSymbol, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appPink
        button.layer.cornerRadius = Constants.cornerRadiusAddButton
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
        super.init(coder: coder)
        print("init(coder:) has not been implemented")
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
        stroriesScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stroriesScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stroriesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stroriesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
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

                addStoryButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
                addStoryButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
                addStoryButton.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor).isActive = true
                addStoryButton.rightAnchor.constraint(equalTo: avatarImageView.rightAnchor).isActive = true
            }

            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
            avatarImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            avatarImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: story.isSelfStory ? 12 : 22)
                .isActive = true

            userNamelabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 4).isActive = true
            userNamelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
            userNamelabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
            userNamelabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor).isActive = true

            leadingAnchor = avatarImageView.trailingAnchor
        }
    }
}
