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
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.hidesForSinglePage = true
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
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont().verdana(ofSize: 10)
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
        label.textAlignment = .left
        label.text = Constants.commentText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timePostLabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Constants.timeText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var postScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(post: Post) {
        addScrollViewSubviews(post.postImageNames)
        configureScrollView(postImagesCount: post.postImageNames.count)
        postPageControl.numberOfPages = post.postImageNames.count
        avatarImageView.image = UIImage(named: post.userAvatarImageName)
        userNameLabel.text = post.userName
        commentUserNameLabel.text = "\(post.userName) \(post.postTitle)"
        loginUserAvatarImageView.image = UIImage(named: post.loginUserAvatarImageName)
        if post.postImageNames.count == 1 {
            postScrollView.isScrollEnabled = false
        }
    }

    // MARK: - Private Methods

    private func configureScrollView(postImagesCount: Int) {
        postScrollView.contentSize.width = contentView.frame.width * CGFloat(postImagesCount) * 1.18

        postScrollView.showsHorizontalScrollIndicator = false
    }

    private func configureUI() {
        addSubviews()
        setupHeaderPostAnchors()
        setupActionButtons()
        setupCommentAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(userNameLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(dotsButton)
        contentView.addSubview(postScrollView)
        contentView.addSubview(postPageControl)
        contentView.addSubview(saveButton)
        contentView.addSubview(likeTitleLabel)
        contentView.addSubview(commentUserNameLabel)
        contentView.addSubview(loginUserAvatarImageView)
        contentView.addSubview(commentLoginLabel)
        contentView.addSubview(timePostLabel)
    }

    private func setupHeaderPostAnchors() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            avatarImageView.heightAnchor.constraint(equalToConstant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 30),

            userNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 30),
            userNameLabel.widthAnchor.constraint(equalToConstant: 107),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6),

            dotsButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            dotsButton.heightAnchor.constraint(equalToConstant: 24),
            dotsButton.widthAnchor.constraint(equalToConstant: 24),
            dotsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),

            postScrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10),
            postScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postScrollView.heightAnchor.constraint(equalToConstant: 239),
        ])
    }

    private func setupCommentAnchors() {
        NSLayoutConstraint.activate([
            postPageControl.heightAnchor.constraint(equalToConstant: 20),
            postPageControl.widthAnchor.constraint(equalToConstant: 100),
            postPageControl.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8),
            postPageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            saveButton.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8),
            saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9),
            saveButton.heightAnchor.constraint(equalToConstant: 24),
            saveButton.widthAnchor.constraint(equalToConstant: 24),

            likeTitleLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6),
            likeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            likeTitleLabel.heightAnchor.constraint(equalToConstant: 15),
            likeTitleLabel.widthAnchor.constraint(equalToConstant: 107),

            commentUserNameLabel.topAnchor.constraint(equalTo: likeTitleLabel.bottomAnchor, constant: 6),
            commentUserNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            commentUserNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            commentUserNameLabel.heightAnchor.constraint(equalToConstant: 30),

            loginUserAvatarImageView.topAnchor.constraint(equalTo: commentUserNameLabel.bottomAnchor, constant: 4),
            loginUserAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            loginUserAvatarImageView.widthAnchor.constraint(equalToConstant: 20),
            loginUserAvatarImageView.heightAnchor.constraint(equalToConstant: 20),

            commentLoginLabel.centerYAnchor.constraint(equalTo: loginUserAvatarImageView.centerYAnchor),
            commentLoginLabel.leadingAnchor.constraint(equalTo: loginUserAvatarImageView.trailingAnchor, constant: 3),
            commentLoginLabel.widthAnchor.constraint(equalToConstant: 150),
            commentLoginLabel.heightAnchor.constraint(equalToConstant: 15),

            timePostLabel.topAnchor.constraint(equalTo: loginUserAvatarImageView.bottomAnchor, constant: 7),
            timePostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            timePostLabel.widthAnchor.constraint(equalToConstant: 150),
            timePostLabel.heightAnchor.constraint(equalToConstant: 15),
            timePostLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),

        ])
    }

    private func setupActionButtons() {
        var leadingAnchor = contentView.leadingAnchor
        for button in [likeButton, commentButton, sendButton] {
            contentView.addSubview(button)
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8),
                button.heightAnchor.constraint(equalToConstant: 24),
                button.widthAnchor.constraint(equalToConstant: 24),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            ])
            leadingAnchor = button.trailingAnchor
        }
    }

    private func addScrollViewSubviews(_ imageNames: [String]) {
        var leadingAnchor = postScrollView.leadingAnchor
        for imageName in imageNames {
            let postImageView = UIImageView()
            postImageView.image = UIImage(named: imageName)
            postImageView.contentMode = .scaleAspectFill
            postImageView.clipsToBounds = true
            postImageView.translatesAutoresizingMaskIntoConstraints = false

            postScrollView.addSubview(postImageView)

            NSLayoutConstraint.activate([
                postImageView.topAnchor.constraint(equalTo: postScrollView.topAnchor),
                postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])

            leadingAnchor = postImageView.trailingAnchor
        }
    }
}

extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        postPageControl.currentPage = Int(scrollView.contentOffset.x / contentView.frame.width)
    }
}
