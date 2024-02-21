// FeedViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран с основной лентой публикаций пользователей
final class FeedViewController: UIViewController {
    // MARK: - Types

    private enum TableCellTypes {
        case stories
        case firstPost
        case post
        case recommend
    }

    // MARK: - Constants

    private enum Constants {
        static let myHistoryText = "Ваша история"
        static let humanHistoryText = "lavanda123"
        static let myProfileImageName = "myProfile"
        static let storiesImageName = "historyWoman"

        static let postUserName = "tur_v_dagestan "
        static let postUserImageName = "dagestanHuman"
        static let postFirstImageName = "dagestan"
        static let postSecondImageName = "postMountians"
        static let postLikeCount = 201
        static let postTitle = "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"

        static let recommendFirstUserName = "сrimea_082"
        static let recommendSecondUserName = "mary_pol"

        static let recommendFirstImageName = "recommendCastle"
        static let recommendSecondImageName = "recommendWoman"
    }

    // MARK: - Visual Components

    private let feedTableView = UITableView()

    private lazy var refreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        return control
    }()

    // MARK: - Private Properties

    private let cellTypes: [TableCellTypes] = [.stories, .firstPost, .recommend, .post]

    private let stories: [Stories] = [
        Stories(userName: Constants.myHistoryText, imageName: Constants.myProfileImageName, isSelfStory: true),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false),
        Stories(userName: Constants.humanHistoryText, imageName: Constants.storiesImageName, isSelfStory: false)
    ]

    private let posts = [
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.postUserImageName,
            postImageNames: [Constants.postFirstImageName],
            likes: Constants.postLikeCount,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.myProfileImageName
        ),
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.postUserImageName,
            postImageNames: [Constants.postFirstImageName],
            likes: Constants.postLikeCount,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.myProfileImageName
        ),
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.postUserImageName,
            postImageNames: [Constants.postFirstImageName],
            likes: Constants.postLikeCount,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.myProfileImageName
        )
    ]

    private let firstPost =
        Post(
            userName: Constants.postUserName,
            userAvatarImageName: Constants.postUserImageName,
            postImageNames: [Constants.postFirstImageName, Constants.postSecondImageName],
            likes: Constants.postLikeCount,
            postTitle: Constants.postTitle,
            loginUserAvatarImageName: Constants.myProfileImageName
        )

    private let recommends = [
        Recommend(userName: Constants.recommendFirstUserName, userAvatarImageName: Constants.recommendFirstImageName),
        Recommend(userName: Constants.recommendSecondUserName, userAvatarImageName: Constants.recommendSecondImageName),
        Recommend(userName: Constants.recommendFirstUserName, userAvatarImageName: Constants.recommendFirstImageName),
        Recommend(userName: Constants.recommendFirstUserName, userAvatarImageName: Constants.recommendFirstImageName)
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(feedTableView)
    }

    private func setupTableView() {
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
        feedTableView.refreshControl = refreshControl
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

        feedTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        feedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        feedTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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

    @objc private func refreshTableView(_ sender: Any) {
        feedTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension FeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let type = cellTypes[section]
        switch type {
        case .stories, .recommend, .firstPost:
            return 1
        case .post:
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellTypes[indexPath.section]
        switch cellType {
        case .stories:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: StoriesTableViewCell.self), for: indexPath
                ) as? StoriesTableViewCell
            else { return UITableViewCell() }
            cell.configure(stories: stories)
            return cell
        case .post, .firstPost:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: PostTableViewCell.self), for: indexPath
                ) as? PostTableViewCell
            else { return UITableViewCell() }
            if cellType == .firstPost {
                cell.configure(post: firstPost)
            } else {
                cell.configure(post: posts[indexPath.row])
            }
            return cell
        case .recommend:
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: RecommendTableViewCell.self), for: indexPath
                ) as? RecommendTableViewCell
            else { return UITableViewCell() }
            cell.configure(recommends: recommends)
            return cell
        }
    }
}
