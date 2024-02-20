// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер с основной лентой публикаций пользователей
final class FeedViewController: UIViewController {
    // MARK: - Constants

    private enum TableCellTypes {
        case stories
        case post
        case recommend
    }

    private enum Constants {
        static let myHistoryText = "Ваша история"
        static let humanHistoryText = "lavanda123"
        static let myProfileImageName = "myProfile"
        static let storiesImageName = "historyWoman"
    }

    // MARK: - Visual Components

    private let feedTableView = UITableView()

    // MARK: - Public Properties

    // MARK: - Private Properties

    private let cellTypes: [TableCellTypes] = [.stories, .post, .recommend]

    private let stories: [Stories] = [
        Stories(userName: Constants.myHistoryText, image: Constants.myProfileImageName, isSelfStory: true),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, image: Constants.storiesImageName, isSelfStory: false)
    ]

    private let posts: [Post] = [
        Post(
            userName: "tur_v_dagestan",
            userAvatarImageName: "dagestanHuman",
            postImageNames: ["dagestan", "postMountians"],
            likes: 201,
            postTitle: "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!",
            loginUserAvatarImageName: "myProfile"
        )
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(feedTableView)
    }

    private func setupTableView() {
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        feedTableView.dataSource = self
        feedTableView.backgroundColor = .white
        feedTableView.separatorStyle = .none
        feedTableView.register(
            StoriesTableViewCell.self,
            forCellReuseIdentifier: String(describing: StoriesTableViewCell.self)
        )
        feedTableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: String(describing: PostTableViewCell.self)
        )
        feedTableView.register(
            RecommendTableViewCell.self,
            forCellReuseIdentifier: String(describing: RecommendTableViewCell.self)
        )

        NSLayoutConstraint.activate([
            feedTableView.topAnchor.constraint(equalTo: view.topAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            feedTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            feedTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        let messageBarItem = UIBarButtonItem(image: .message, style: .plain, target: nil, action: nil)
        messageBarItem.tintColor = .black
        navigationItem.rightBarButtonItem = messageBarItem

        let logoBarItem = UIBarButtonItem(image: .logo, style: .plain, target: nil, action: nil)
        logoBarItem.tintColor = .black
        navigationItem.leftBarButtonItem = logoBarItem
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.row]
        switch cellType {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: StoriesTableViewCell.self), for: indexPath
                ) as? StoriesTableViewCell
            else { return UITableViewCell() }
            cell.configure(stories: stories)
            return cell
        case .post:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: PostTableViewCell.self), for: indexPath
                ) as? PostTableViewCell
            else { return UITableViewCell() }
            cell.configure(post: posts.first ?? Post(
                userName: "",
                userAvatarImageName: "",
                postImageNames: [""],
                likes: 2,
                postTitle: "",
                loginUserAvatarImageName: ""
            ))
            return cell
        case .recommend:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: RecommendTableViewCell.self), for: indexPath
                ) as? RecommendTableViewCell
            else { return UITableViewCell() }
            cell.configure(recommends: [
                Recommend(userName: "dsdsd", userAvatarImageName: "recommendCastle"),
                Recommend(userName: "dsdsd", userAvatarImageName: "recommendCastle"),
                Recommend(userName: "dsdsd", userAvatarImageName: "recommendCastle")
            ])
            return cell
        }
    }
}
