// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Thanks View Controller
class ThanksViewController: UIViewController {
    @IBOutlet var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.layer.cornerRadius = 12
        view.backgroundColor = .white
    }

    @IBAction func pressClose(_ sender: Any) {
        dismiss(animated: true)
    }
}
