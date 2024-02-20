// PostTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для поста
final class PostTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let likeText = "Нравится: "
        static let commentText = "Комментировать ..."
        static let timeText = "10 минут назад"
        static let storyWidth: CGFloat = 82
    }

    // MARK: - Visual Components

    private let avatarImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dotsButton = {
        let button = UIButton()
        button.setImage(.dots, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let postPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private let postImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let likeButton = {
        let button = UIButton()
        button.setImage(.postActionLike, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let commentButton = {
        let button = UIButton()
        button.setImage(.postActionComment, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sendButton = {
        let button = UIButton()
        button.setImage(.postActionSend, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton = {
        let button = UIButton()
        button.setImage(.postActionSave, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeTitleLabel = {
        let label = UILabel()
        label.text = Constants.likeText
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let commentUserNameLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginUserAvatarImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let commentLoginLabel = {
        let label = UILabel()
        label.text = Constants.commentText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timePostLabel = {
        let label = UILabel()
        label.text = Constants.timeText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    // MARK: - Private Properties

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
        stroriesScrollView.contentSize.width = CGFloat(Int(Constants.storyWidth) * storiesCount)

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
            avatarImageView.image = UIImage(named: story.image)
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
                userNamelabel.heightAnchor.constraint(equalToConstant: 10),
                userNamelabel.widthAnchor.constraint(equalToConstant: 74),
                userNamelabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor)
            ])

            leadingAnchor = avatarImageView.trailingAnchor
        }
    }

}
