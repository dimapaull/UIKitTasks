// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран в котором представлена лента уведомлений
final class NotificationViewController: UIViewController {
    // MARK: - Types

    private enum TableSectionTypes: String {
        /// Сегодня
        case today = "Сегодня"
        /// На этой неделе
        case week = "На этой неделе"
    }

    private enum TableCellTypes {
        /// Подписка
        case subscribe
        /// Действиия с постом 
        case commentPost
    }

    // MARK: - Constants

    private enum Constants {
        static let controllerTitle = "Уведомления"
        static let requsetText = "Запросы на подписку"

        static let firstPostUserName = "lavanda123 "
        static let secondPostUserName = "12miho "
        static let thirdPostUserName = "markS "
        static let fourPostUserName = "sv_neit "

        static let likePostUserText = "понравился ваш комментарий: \"Очень красиво!\" "
        static let mentionPostUserText = "упомянул(-а) вас в комментарии: @rm Спасибо! "
        static let commentPostUserText = " онравился ваш комментарий: \"Это где?\" "
        static let newUserText = "появился(-ась) в RMLink. Вы можете быть знакомы "
        static let subscribeText = "подписался(-ась) на ваши новости "
        static let likeCommentText = "понравился ваш комментарий: \"Ты вернулась?\" "

        static let fisrtUserImageName = "historyWoman"
        static let secondUserImageName = "postHuman"
        static let thirdUserImageName = "personAvatar"
        static let fourUserImageName = "womanAvatar"

        static let seaImageName = "notificationSea"
        static let museumImageName = "museum"

        static let hours = "ч"
        static let days = "д."
    }

    // MARK: - Visual Components

    private let notificationTableView = UITableView()

    private let requestsButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = .left
        button.setTitle(Constants.requsetText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont().verdana(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Private Properties

    private let cellTypes: [TableCellTypes] = [.commentPost, .subscribe]
    private let sectionTypes: [TableSectionTypes] = [.today, .week]

    private var notifications = [
        [
            Notification(
                userName: Constants.firstPostUserName,
                titleNotification: Constants.likePostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                timeNotification: "\(12)\(Constants.hours)",
                postImageName: Constants.seaImageName, isMention: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                titleNotification: Constants.mentionPostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                timeNotification: "\(12)\(Constants.hours)",
                postImageName: Constants.seaImageName, isMention: true
            )
        ],
        [
            Notification(
                userName: Constants.firstPostUserName,
                titleNotification: Constants.commentPostUserText,
                avatarUserImageName: Constants.fisrtUserImageName,
                timeNotification: "\(3)\(Constants.days)",
                postImageName: Constants.museumImageName, isMention: false
            ),
            Notification(
                userName: Constants.secondPostUserName,
                titleNotification: Constants.newUserText,
                avatarUserImageName: Constants.secondUserImageName,
                timeNotification: "\(3)\(Constants.days)",
                postImageName: nil, isMention: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                titleNotification: Constants.subscribeText,
                avatarUserImageName: Constants.fisrtUserImageName,
                timeNotification: "\(5)\(Constants.days)",
                postImageName: nil, isMention: false
            ),
            Notification(
                userName: Constants.firstPostUserName,
                titleNotification: Constants.likeCommentText,
                avatarUserImageName: Constants.fisrtUserImageName,
                timeNotification: "\(7)\(Constants.days)",
                postImageName: Constants.museumImageName, isMention: false
            ),
            Notification(
                userName: Constants.thirdPostUserName,
                titleNotification: Constants.newUserText,
                avatarUserImageName: Constants.thirdUserImageName,
                timeNotification: "\(8)\(Constants.days)",
                postImageName: nil, isMention: false
            ),
            Notification(
                userName: Constants.fourPostUserName,
                titleNotification: Constants.newUserText,
                avatarUserImageName: Constants.fourUserImageName,
                timeNotification: "\(8)\(Constants.days)",
                postImageName: nil, isMention: false
            )
        ]
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUI()
        configureTableView()
    }

    // MARK: - Private Methods

    private func setupNavigationBar() {
        title = Constants.controllerTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureTableView() {
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false
        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.backgroundColor = .white
        notificationTableView.showsVerticalScrollIndicator = false
        notificationTableView.separatorStyle = .none
        notificationTableView.register(
            SubscribeTableViewCell.self,
            forCellReuseIdentifier: String(describing: SubscribeTableViewCell.self)
        )
        notificationTableView.register(
            CommentPostTableViewCell.self,
            forCellReuseIdentifier: String(describing: CommentPostTableViewCell.self)
        )
    }

    private func configureUI() {
        view.backgroundColor = .white
        addSubviews()
        setupAnchors()
    }

    private func addSubviews() {
        view.addSubview(requestsButton)
        view.addSubview(notificationTableView)
    }

    private func setupAnchors() {
        requestsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        requestsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        requestsButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        requestsButton.widthAnchor.constraint(equalToConstant: 251).isActive = true

        notificationTableView.topAnchor.constraint(equalTo: requestsButton.bottomAnchor).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        notificationTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTypes.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notifications[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if notifications[indexPath.section][indexPath.row].isPostNotification {
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: SubscribeTableViewCell.self), for: indexPath
                ) as? SubscribeTableViewCell
            else { return UITableViewCell() }
            cell.configure(notification: notifications[indexPath.section][indexPath.row])
            return cell
        } else {
            guard let cell = tableView
                .dequeueReusableCell(
                    withIdentifier: String(describing: CommentPostTableViewCell.self), for: indexPath
                ) as? CommentPostTableViewCell
            else { return UITableViewCell() }
            cell.configure(notification: notifications[indexPath.section][indexPath.row])
            return cell
        }
    }

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        notifications[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.font = UIFont().verdanaBold(ofSize: 14)
        label.text = sectionTypes[section].rawValue
        return label
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        35
    }
}
