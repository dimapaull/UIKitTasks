// NewBirthdayViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер для добавления нового дня рождения
class NewBirthdayViewController: UIViewController {
    // MARK: - Private Properties

    private let personalData = PersonData()

    private let cancelButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 25, width: 50, height: 20))
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(nil, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    private let addButton = {
        let button = UIButton(frame: CGRect(x: 325, y: 25, width: 30, height: 20))
        button.setTitle("Add", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(nil, action: #selector(closeScreen), for: .touchUpInside)
        return button
    }()

    private let avatarImageView = {
        let imageView = UIImageView(image: .avatar)
        imageView.frame = CGRect(x: 0, y: 100, width: 125, height: 125)
        return imageView
    }()

    private let changePhotoButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 233, width: 125, height: 20))
        button.setTitle("Change photo", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    private let nameTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 336, width: 335, height: 30))
        textField.placeholder = "Typing Name Surname"
        textField.addLine()
        return textField
    }()

    private let birthdayTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 411, width: 335, height: 30))
        textField.placeholder = "Typing Date of Birth"
        textField.addLine()
        return textField
    }()

    private let birthdayDatePickerView = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()

    private let ageTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 486, width: 335, height: 30))
        textField.placeholder = "Typing age"
        textField.addLine()
        return textField
    }()

    private lazy var agePickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private let genderTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 559, width: 335, height: 30))
        textField.placeholder = "Indicate Gender"
        textField.addLine()
        return textField
    }()

    private lazy var genderPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()

    private let telegramTextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 634, width: 335, height: 30))
        textField.placeholder = "Typing Telegram"
        textField.addLine()
        return textField
    }()

    private lazy var toolbarForDate: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(formatDate))
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        return toolbar
    }()

    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "OK", style: .done, target: self, action: #selector(formatDate))
        let flexibleSpace = UIBarButtonItem(systemItem: .flexibleSpace)
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        return toolbar
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupUI()
        addInputView()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(cancelButton)
        view.addSubview(addButton)

        avatarImageView.center.x = view.center.x
        view.addSubview(avatarImageView)

        changePhotoButton.center.x = view.center.x
        view.addSubview(changePhotoButton)

        let nameLabel = addPeakerTitleLabel(yPoint: 307, text: "Name Surname")
        view.addSubview(nameLabel)

        let birthdayLabel = addPeakerTitleLabel(yPoint: 382, text: "Birthday")
        view.addSubview(birthdayLabel)

        let ageLabel = addPeakerTitleLabel(yPoint: 457, text: "Age")
        view.addSubview(ageLabel)

        let genderLabel = addPeakerTitleLabel(yPoint: 530, text: "Gender")
        view.addSubview(genderLabel)

        let telegramLabel = addPeakerTitleLabel(yPoint: 605, text: "Telegram")
        view.addSubview(telegramLabel)

        nameTextField.center.x = view.center.x
        view.addSubview(nameTextField)

        birthdayTextField.center.x = view.center.x
        view.addSubview(birthdayTextField)

        ageTextField.center.x = view.center.x
        view.addSubview(ageTextField)

        genderTextField.center.x = view.center.x
        view.addSubview(genderTextField)

        telegramTextField.center.x = view.center.x
        view.addSubview(telegramTextField)
    }

    private func addInputView() {
        nameTextField.delegate = self
        telegramTextField.addTarget(nil, action: #selector(addTelegramAction), for: .touchDown)

        birthdayTextField.inputAccessoryView = toolbarForDate
        birthdayTextField.inputView = birthdayDatePickerView

        ageTextField.inputAccessoryView = toolbar
        ageTextField.inputView = agePickerView

        genderTextField.inputAccessoryView = toolbar
        genderTextField.inputView = genderPickerView
    }

    private func addPeakerTitleLabel(yPoint: Int, text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 20, y: yPoint, width: 175, height: 19))
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }

    @objc private func formatDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        birthdayTextField.text = formatter.string(from: birthdayDatePickerView.date)
        view.endEditing(true)
    }

    @objc private func hideToolbar() {
        view.endEditing(true)
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }

    @objc private func addTelegramAction() {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            let text = alert.textFields?.first?.text ?? ""
            self.telegramTextField.text = text
        }
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
}

extension NewBirthdayViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case agePickerView:
            return personalData.ageStorage.count
        case genderPickerView:
            return personalData.genders.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case agePickerView:
            return String(personalData.ageStorage[row])
        case genderPickerView:
            return personalData.genders[row]
        default:
            return nil
        }
    }
}

extension NewBirthdayViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case agePickerView:
            ageTextField.text = String(personalData.ageStorage[row])
        case genderPickerView:
            genderTextField.text = personalData.genders[row]
        default:
            break
        }
    }
}

extension NewBirthdayViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}
