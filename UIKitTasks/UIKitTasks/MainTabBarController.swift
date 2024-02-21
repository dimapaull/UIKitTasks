// MainTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Таббар для всего приложения
final class MainTabBarController: UITabBarController {
    // MARK: - Constants

    private enum Constants {
        static let tabBatTitles = ["Лента", "Уведомления", "Профиль"]
        static let tabBatImages: [UIImage] = [.tabBarHome, .tabBarNotification, .tabBarProfile]
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupTabBarItems()
    }

    // MARK: - Private Methods

    private func configure() {
        tabBar.tintColor = .appBlue
        tabBar.unselectedItemTintColor = .black
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.3
        tabBar.layer.borderColor = UIColor.lightGray.cgColor

        let navigationFeedViewController = UINavigationController(rootViewController: FeedViewController())
        let navigationNotificationViewController =
            UINavigationController(rootViewController: NotificationViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())

        let controllers = [navigationFeedViewController, navigationNotificationViewController, profileViewController]

        setViewControllers(controllers, animated: true)
    }

    private func setupTabBarItems() {
        guard let tabBatControllers = viewControllers else { return }
        for controllerIndex in tabBatControllers.indices {
            let tabBarItem = UITabBarItem(
                title: Constants.tabBatTitles[controllerIndex],
                image: Constants.tabBatImages[controllerIndex],
                tag: controllerIndex
            )

            tabBatControllers[controllerIndex].tabBarItem = tabBarItem
        }
    }
}
