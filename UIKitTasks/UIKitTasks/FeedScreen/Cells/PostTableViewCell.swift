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
        return imageView
    }()

    private let userNameLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 12)
        return label
    }()

    private let dotsButton = {
        let button = UIButton()
        button.setImage(.dots, for: .normal)
        button.tintColor = .black
        return button
    }()

    private let postPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.hidesForSinglePage = true
        return pageControl
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
        return button
    }()

    private let likeTitleLabel = {
        let label = UILabel()
        label.text = Constants.likeText
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 10)
        return label
    }()

    private let commentUserNameLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont().verdana(ofSize: 10)
        return label
    }()

    private let loginUserAvatarImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private let commentLoginLabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Constants.commentText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        return label
    }()

    private let timePostLabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Constants.timeText
        label.textColor = .appGray
        label.font = UIFont().verdana(ofSize: 10)
        return label
    }()

    private lazy var postScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
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
        likeTitleLabel.text?.append("\(post.likes)")
        configureScrollView(postImagesCount: post.postImageNames.count)
        postPageControl.numberOfPages = post.postImageNames.count
        avatarImageView.image = UIImage(named: post.userAvatarImageName)
        userNameLabel.text = post.userName
        commentUserNameLabel.setupLabelAttribute(
            fontSize: 10,
            title: post.userName,
            descripton: post.postTitle,
            additionalText: nil
        )
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
        for view in [
            userNameLabel,
            avatarImageView,
            dotsButton,
            postScrollView,
            postPageControl,
            saveButton,
            likeTitleLabel,
            commentUserNameLabel,
            loginUserAvatarImageView,
            commentLoginLabel,
            timePostLabel
        ] {
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
        }
    }

    private func setupHeaderPostAnchors() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true

        userNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userNameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6).isActive = true

        dotsButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        dotsButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        dotsButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        dotsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true

        postScrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
        postScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        postScrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
    }

    private func setupCommentAnchors() {
        postPageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        postPageControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        postPageControl.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8).isActive = true
        postPageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

        saveButton.topAnchor.constraint(equalTo: postScrollView.bottomAnchor, constant: 8).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -9).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        saveButton.widthAnchor.constraint(equalToConstant: 24).isActive = true

        likeTitleLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 6).isActive = true
        likeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        likeTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        likeTitleLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true

        commentUserNameLabel.topAnchor.constraint(equalTo: likeTitleLabel.bottomAnchor, constant: 6).isActive = true
        commentUserNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
            .isActive = true
        commentUserNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
            .isActive = true
        commentUserNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        loginUserAvatarImageView.topAnchor.constraint(equalTo: commentUserNameLabel.bottomAnchor, constant: 4)
            .isActive = true
        loginUserAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13)
            .isActive = true
        loginUserAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        loginUserAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentLoginLabel.centerYAnchor.constraint(equalTo: loginUserAvatarImageView.centerYAnchor).isActive = true
        commentLoginLabel.leadingAnchor.constraint(equalTo: loginUserAvatarImageView.trailingAnchor, constant: 3)
            .isActive = true
        commentLoginLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentLoginLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        timePostLabel.topAnchor.constraint(equalTo: loginUserAvatarImageView.bottomAnchor, constant: 7)
            .isActive = true
        timePostLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        timePostLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        timePostLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        timePostLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
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

            postImageView.topAnchor.constraint(equalTo: postScrollView.topAnchor).isActive = true
            postImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

            leadingAnchor = postImageView.trailingAnchor
        }
    }
}

extension PostTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        postPageControl.currentPage = Int(scrollView.contentOffset.x / contentView.frame.width)
    }
}
