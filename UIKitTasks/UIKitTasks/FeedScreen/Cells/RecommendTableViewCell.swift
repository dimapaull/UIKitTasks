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
        label.font = UIFont.verdanaBold(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .right
        button.setTitle(Constants.allText, for: .normal)
        button.titleLabel?.font = UIFont.verdanaBold(ofSize: 10)
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
        super.init(coder: coder)
        configureUI()
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
            let backgroundCardView = RecommendView(recommend: recommend)
            backgroundCardView.backgroundColor = .white
            backgroundCardView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(backgroundCardView)

            backgroundCardView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            backgroundCardView.widthAnchor.constraint(equalToConstant: 185).isActive = true
            backgroundCardView.topAnchor.constraint(equalTo: recommendScrollView.topAnchor).isActive = true
            backgroundCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
            backgroundCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
                .isActive = true

            leadingAnchor = backgroundCardView.trailingAnchor
        }
    }
}
