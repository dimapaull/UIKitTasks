// BrowserViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран с браузером
final class BrowserViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let spaceXLinkText = "https://www.spacex.com/vehicles/starship/"
    }

    // MARK: - Visual Components

    private let webView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    private let toolBar = {
        let toolBar = UIToolbar()
        toolBar.backgroundColor = .white
        toolBar.translatesAutoresizingMaskIntoConstraints = false

        let reloadBarButtonItem = UIBarButtonItem(
            image: .reload,
            style: .plain,
            target: nil,
            action: #selector(reloadWeb)
        )
        reloadBarButtonItem.tintColor = .black
        let backBarButtonItem = UIBarButtonItem(
            image: .leftArrows,
            style: .plain,
            target: nil,
            action: #selector(backListWeb)
        )
        backBarButtonItem.tintColor = .black

        let listBarButtonItem = UIBarButtonItem(
            image: .rightArrows,
            style: .plain,
            target: nil,
            action: #selector(nextListWeb)
        )
        listBarButtonItem.tintColor = .black

        let space = UIBarButtonItem.flexibleSpace()
        let fixedSpace = UIBarButtonItem.fixedSpace(31)
        toolBar.items = [backBarButtonItem, fixedSpace, listBarButtonItem, space, reloadBarButtonItem]

        return toolBar
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        loadRequest()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.addSubview(webView)
        view.addSubview(toolBar)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        toolBar.heightAnchor.constraint(equalToConstant: 75).isActive = true
        toolBar.bottomAnchor.constraint(equalTo: webView.bottomAnchor).isActive = true
        toolBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(string: Constants.spaceXLinkText) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    @objc private func reloadWeb() {
        webView.reload()
    }

    @objc private func nextListWeb() {
        webView.goForward()
    }

    @objc private func backListWeb() {
        webView.goBack()
    }
}
