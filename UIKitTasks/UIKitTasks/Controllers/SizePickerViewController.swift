// SizePickerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Всплывающее Вью с выбором размера обуви
class SizePickerViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let title = "Размер Ноги"
        static let saveButtonTitle = "Сохранить"
        static let buttonBackgroundColor = #colorLiteral(red: 0.8828063011, green: 0.09558037668, blue: 0.511828959, alpha: 1)
        static let viewCornerRadius = CGFloat(20)
        static let titleFont = "Verdana-Bold"
        static let regularFontSize = CGFloat(16)
    }

    // MARK: - Visual Components

    private let backGroundView = UIView()
    private let sizePicker = UIPickerView()
    private let saveButton = UIButton()
    private let closeButton = UIButton()
    private let titleLabel = UILabel()

    // MARK: - Public Properties

    var shoeSizeTextField: UITextField?

    // MARK: - Private Priperties

    private let sizes = Array(35 ... 39)

    // MARK: - Live Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupUI()
        setupSizePicker()
        setupButtons()
    }

    // MARK: - Private Methods

    private func addViews() {
        view.addSubview(backGroundView)
        backGroundView.addSubview(titleLabel)
        backGroundView.addSubview(sizePicker)
        backGroundView.addSubview(closeButton)
        backGroundView.addSubview(saveButton)
    }

    private func setupUI() {
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

        backGroundView.backgroundColor = .white
        backGroundView.layer.cornerRadius = Constants.viewCornerRadius
        backGroundView.translatesAutoresizingMaskIntoConstraints = false
        backGroundView.layer.shadowColor = UIColor.black.cgColor
        backGroundView.layer.shadowOpacity = 0.5
        backGroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backGroundView.layer.shadowRadius = 4

        backGroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backGroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height - 300)
            .isActive = true
        backGroundView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        backGroundView.heightAnchor.constraint(equalToConstant: 283).isActive = true

        titleLabel.text = Constants.title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: Constants.titleFont, size: Constants.regularFontSize)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.widthAnchor.constraint(equalToConstant: 133).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 7).isActive = true

        sizePicker.translatesAutoresizingMaskIntoConstraints = false
        sizePicker.widthAnchor.constraint(equalToConstant: 357).isActive = true
        sizePicker.heightAnchor.constraint(equalToConstant: 88).isActive = true
        sizePicker.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 75).isActive = true
        sizePicker.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor).isActive = true

        saveButton.setTitle(Constants.saveButtonTitle, for: .normal)
        saveButton.titleLabel?.font = UIFont(name: Constants.titleFont, size: Constants.regularFontSize)
        saveButton.backgroundColor = Constants.buttonBackgroundColor
        saveButton.layer.cornerRadius = Constants.viewCornerRadius
        saveButton.layer.shadowColor = UIColor.black.cgColor
        saveButton.layer.shadowOpacity = 0.5
        saveButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        saveButton.layer.shadowRadius = 4

        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.centerXAnchor.constraint(equalTo: backGroundView.centerXAnchor).isActive = true
        saveButton.bottomAnchor.constraint(equalTo: backGroundView.bottomAnchor, constant: -31).isActive = true

        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.backgroundColor = .clear
        closeButton.tintColor = .black

        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 14).isActive = true
        closeButton.topAnchor.constraint(equalTo: backGroundView.topAnchor, constant: 14).isActive = true
        closeButton.rightAnchor.constraint(equalTo: backGroundView.rightAnchor, constant: -14).isActive = true
    }

    private func setupSizePicker() {
        sizePicker.delegate = self
        sizePicker.dataSource = self
    }

    private func setupButtons() {
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    private func selectedSize() -> String? {
        let selectedRow = sizePicker.selectedRow(inComponent: 0)
        return sizes.indices.contains(selectedRow) ? "\(sizes[selectedRow])" : nil
    }

    @objc private func saveButtonTapped() {
        guard let selectedSize = selectedSize() else { return }
        shoeSizeTextField?.text = selectedSize
        dismiss(animated: true)
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

extension SizePickerViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sizes.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(sizes[row])"
    }
}
