// RecommendTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка в которой расположены рекомендации для пользователя
final class RecommendTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let subscribeText = "Подписаться"
        static let recommendText = "Рекомендуем вам"
        static let allText = "Все"
        static let cardWidth: CGFloat = 185
        static let cardMargin: CGFloat = 20
    }

    // MARK: - Visual Components

    private let recommendTitleLabel = {
        let label = UILabel()
        label.text = Constants.recommendText
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont().verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .right
        button.setTitle(Constants.allText, for: .normal)
        button.titleLabel?.font = UIFont().verdanaBold(ofSize: 10)
        button.setTitleColor(.appBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let recommendScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
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

    func configure(recommends: [Recommend]) {
        configureScrollView(postImagesCount: recommends.count)
        createRecommendCard(recommends)
    }

    // MARK: - Private Methods

    private func configureScrollView(postImagesCount: Int) {
        recommendScrollView.contentSize.width = (Constants.cardWidth + Constants.cardMargin) * CGFloat(postImagesCount)
    }

    private func configureUI() {
        contentView.backgroundColor = .appSoftBlue
        addSubviews()
        setupHeaderRecommendAnchors()
    }

    private func addSubviews() {
        contentView.addSubview(recommendTitleLabel)
        contentView.addSubview(allButton)
        contentView.addSubview(recommendScrollView)
    }

    private func setupHeaderRecommendAnchors() {
        recommendTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        recommendTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        recommendTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        recommendTitleLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true

        allButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        allButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        allButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        allButton.heightAnchor.constraint(equalToConstant: 15).isActive = true

        recommendScrollView.topAnchor.constraint(equalTo: recommendTitleLabel.bottomAnchor, constant: 21)
            .isActive = true
        recommendScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        recommendScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        recommendScrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    private func createRecommendCard(_ recommends: [Recommend]) {
        var leadingAnchor = recommendScrollView.leadingAnchor
        for recommend in recommends {
            let backgroundCardView = UIView()
            backgroundCardView.backgroundColor = .white
            backgroundCardView.translatesAutoresizingMaskIntoConstraints = false

            let recommendImageView = UIImageView(image: UIImage(named: recommend.userAvatarImageName))
            recommendImageView.contentMode = .scaleAspectFill
            recommendImageView.clipsToBounds = true
            recommendImageView.layer.cornerRadius = 57.5
            recommendImageView.translatesAutoresizingMaskIntoConstraints = false

            let deleteButton = UIButton()
            deleteButton.setImage(.delete, for: .normal)
            deleteButton.tintColor = .black
            deleteButton.translatesAutoresizingMaskIntoConstraints = false

            let subscribeButton = UIButton()
            subscribeButton.setTitle(Constants.subscribeText, for: .normal)
            subscribeButton.titleLabel?.font = UIFont().verdanaBold(ofSize: 10)
            subscribeButton.setTitleColor(.white, for: .normal)
            subscribeButton.backgroundColor = .appBlue
            subscribeButton.layer.cornerRadius = 8
            subscribeButton.translatesAutoresizingMaskIntoConstraints = false

            let userNameLabel = UILabel()
            userNameLabel.text = recommend.userName
            userNameLabel.textAlignment = .center
            userNameLabel.textColor = .black
            userNameLabel.font = UIFont().verdana(ofSize: 10)
            userNameLabel.translatesAutoresizingMaskIntoConstraints = false

            recommendScrollView.addSubview(backgroundCardView)
            recommendScrollView.addSubview(recommendImageView)
            recommendScrollView.addSubview(deleteButton)
            recommendScrollView.addSubview(subscribeButton)
            recommendScrollView.addSubview(userNameLabel)

            backgroundCardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            backgroundCardView.widthAnchor.constraint(equalToConstant: 185).isActive = true
            backgroundCardView.topAnchor.constraint(equalTo: recommendScrollView.topAnchor).isActive = true
            backgroundCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            backgroundCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
                .isActive = true

            recommendImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true
            recommendImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
            recommendImageView.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 15)
                .isActive = true
            recommendImageView.centerXAnchor.constraint(equalTo: backgroundCardView.centerXAnchor).isActive = true

            deleteButton.heightAnchor.constraint(equalToConstant: 7).isActive = true
            deleteButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
            deleteButton.topAnchor.constraint(equalTo: backgroundCardView.topAnchor, constant: 8.5).isActive = true
            deleteButton.trailingAnchor.constraint(equalTo: backgroundCardView.trailingAnchor, constant: -8.5)
                .isActive = true

            userNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
            userNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
            userNameLabel.topAnchor.constraint(equalTo: recommendImageView.bottomAnchor, constant: 5)
                .isActive = true
            userNameLabel.centerXAnchor.constraint(equalTo: backgroundCardView.centerXAnchor).isActive = true

            subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
            subscribeButton.bottomAnchor.constraint(equalTo: backgroundCardView.bottomAnchor, constant: -14)
                .isActive = true
            subscribeButton.centerXAnchor.constraint(equalTo: backgroundCardView.centerXAnchor).isActive = true

            leadingAnchor = backgroundCardView.trailingAnchor
        }
    }
}
