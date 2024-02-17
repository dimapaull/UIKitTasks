// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,

        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()

        let basketViewController = BasketViewController()
        basketViewController.setupTabBarItem()

        let catalogViewController = CatalogViewController()
        catalogViewController.setupTabBarItem()

        let catalogNavigationController = UINavigationController(rootViewController: catalogViewController)
        let profileNavigationController = UINavigationController(rootViewController: ProfileViewController())

        let tabBarController = UITabBarController()
        tabBarController.tabBar.layer.borderWidth = 0.5
        tabBarController.tabBar.layer.borderColor = UIColor.gray.cgColor
        tabBarController.tabBar.tintColor = .appPink
        tabBarController.tabBar.unselectedItemTintColor = .black

        tabBarController.viewControllers = [
            catalogNavigationController,
            basketViewController,
            profileNavigationController
        ]

        window?.rootViewController = tabBarController
    }
}
