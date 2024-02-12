// AppDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let loginViewController = ProductConfigurateViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        navigationController.navigationBar.isHidden = true // Скрыть навигационную панель, если не требуется
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

// @main
// class AppDelegate: UIResponder, UIApplicationDelegate {
//    func application(
//        _ application: UIApplication,
//
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        true
//    }
//
//    // MARK: UISceneSession Lifecycle
//
//    func application(
//        _ application: UIApplication,
//
//        configurationForConnecting connectingSceneSession: UISceneSession,
//        options: UIScene.ConnectionOptions
//    ) -> UISceneConfiguration {
//        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
// }

// @main
// class AppDelegate: UIResponder, UIApplicationDelegate {
//    var window: UIWindow?
//
//    func application(
//        _ application: UIApplication,
//        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//        let window = UIWindow()
//
//        window.rootViewController = LoginViewController()
//        window.makeKeyAndVisible()
//
//        self.window = window
//
//        return true
//    }
// }
