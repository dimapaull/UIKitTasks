// UserDataViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран ввода данных пользователя
final class UserDataViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let title = "Мои данные"
        static let firstName = "Имя"
        static let lastName = "Фамилия"
        static let telephone = "Номер телефона"
        static let shoeSize = "Размер ноги"
        static let dateOdBirth = "Дата Рождения"
        static let email = "Почта"
        static let textFieldBackgrundColor = #colorLiteral(red: 0.9728776813, green: 0.9728776813, blue: 0.9728776813, alpha: 1)
        static let textFieldCornerRadius = CGFloat(12)
        static let maxNumberCount = 11
        static let titleFont = "Verdana-Bold"
        static let regularFont = "Verdana"
        static let regularFontSize = CGFloat(16)
    }

    // MARK: - Visual Components

    private let nameTextField = UITextField()
    private let lastNameTextField = UITextField()
    private let phoneTextField = UITextField()
    private let shoeSizeTextField = UITextField()
    private let dateOfBirthTextField = UITextField()
    private let emailTextField = UITextField()

    // MARK: - Private Properties

    private let sizes = Array(35 ... 39)
    private let sizePicker = UIPickerView()
    private let birthdayDatePicker = UIDatePicker()
    private let regex: NSRegularExpression = {
        do {
            return try NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        } catch {
            fatalError("Failed to create regular expression: \(error)")
        }
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        addViews()

        setupUI()
        setupBirthdayDatePicker()
        setupSizePicker()
        keyboardSetup()
    }

    // MARK: - Private Methods

    private func keyboardSetup() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    private func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
        title = Constants.title

        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(backButtonPressed)
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
    }

    private func setupUI() {
        view.backgroundColor = .white
        setupNameTextField()
        setupLastNameTextField()
        setupTelephoneTextField()
        setupShoeSizeTextField()
        setupDateOfBirthTextField()
        setupEmailTextField()
    }

    private func setupNameTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        nameTextField.placeholder = Constants.firstName
        nameTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        nameTextField.backgroundColor = Constants.textFieldBackgrundColor
        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        nameTextField.delegate = self

        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }

    private func setupLastNameTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        lastNameTextField.placeholder = Constants.lastName
        lastNameTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        lastNameTextField.backgroundColor = Constants.textFieldBackgrundColor
        lastNameTextField.leftView = paddingView
        lastNameTextField.leftViewMode = .always
        lastNameTextField.delegate = self

        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        lastNameTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupTelephoneTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        phoneTextField.placeholder = Constants.telephone
        phoneTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        phoneTextField.backgroundColor = Constants.textFieldBackgrundColor
        phoneTextField.leftView = paddingView
        phoneTextField.leftViewMode = .always
        phoneTextField.keyboardType = .numberPad
        phoneTextField.delegate = self

        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupShoeSizeTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        shoeSizeTextField.placeholder = Constants.shoeSize
        shoeSizeTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        shoeSizeTextField.backgroundColor = Constants.textFieldBackgrundColor
        shoeSizeTextField.leftView = paddingView
        shoeSizeTextField.leftViewMode = .always
        shoeSizeTextField.addTarget(self, action: #selector(shoeSizeTextFieldTapped), for: .editingDidBegin)
        shoeSizeTextField.inputView = UIView(frame: CGRect.zero)

        shoeSizeTextField.translatesAutoresizingMaskIntoConstraints = false
        shoeSizeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        shoeSizeTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        shoeSizeTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        shoeSizeTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupDateOfBirthTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        dateOfBirthTextField.placeholder = Constants.dateOdBirth
        dateOfBirthTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        dateOfBirthTextField.backgroundColor = Constants.textFieldBackgrundColor
        dateOfBirthTextField.leftView = paddingView
        dateOfBirthTextField.leftViewMode = .always
        dateOfBirthTextField.inputView = birthdayDatePicker
        dateOfBirthTextField.delegate = self

        dateOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirthTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        dateOfBirthTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        dateOfBirthTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        dateOfBirthTextField.topAnchor.constraint(equalTo: shoeSizeTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupEmailTextField() {
        let paddingView = UILabel()
        paddingView.text = "  "

        emailTextField.placeholder = Constants.email
        emailTextField.layer.cornerRadius = Constants.textFieldCornerRadius
        emailTextField.backgroundColor = Constants.textFieldBackgrundColor
        emailTextField.leftView = paddingView
        emailTextField.leftViewMode = .always
        emailTextField.keyboardType = .emailAddress
        emailTextField.delegate = self

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor, constant: 10).isActive = true
    }

    private func setupSizePicker() {
        sizePicker.delegate = self
        sizePicker.dataSource = self
        sizePicker.backgroundColor = .white
    }

    private func setupBirthdayDatePicker() {
        birthdayDatePicker.datePickerMode = .date
        birthdayDatePicker.preferredDatePickerStyle = .inline
        birthdayDatePicker.backgroundColor = .white
        birthdayDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
    }

    private func addViews() {
        view.addSubview(nameTextField)
        view.addSubview(lastNameTextField)
        view.addSubview(phoneTextField)
        view.addSubview(shoeSizeTextField)
        view.addSubview(dateOfBirthTextField)
        view.addSubview(emailTextField)
    }

    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }

        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")

        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex ..< maxIndex])
        }

        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex ..< maxIndex])
        }

        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex

        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression,
                range: regRange
            )
            print("pattern 1")
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression,
                range: regRange
            )
            print("pattern 2")
        }
        return "+" + number
    }

    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0 {
                returnValue = false
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }

        return returnValue
    }

    private func warnInvalidEmail() {
        let alertController = UIAlertController(
            title: "Почта указана неверно!",
            message: "Укажите корректный адрес электронной почты",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    private func confirmValidEmail() {
        let alertController = UIAlertController(title: nil, message: "Адрес почты сохранен", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateOfBirthTextField.text = dateFormatter.string(from: birthdayDatePicker.date)
        dateOfBirthTextField.resignFirstResponder()
    }

    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }

    @objc private func shoeSizeTextFieldTapped() {
        let sizePickerVC = SizePickerViewController()
        sizePickerVC.shoeSizeTextField = shoeSizeTextField
        sizePickerVC.modalPresentationStyle = .overFullScreen
        sizePickerVC.modalTransitionStyle = .crossDissolve
        present(sizePickerVC, animated: true)
    }
}

extension UserDataViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        sizes.count
    }
}

extension UserDataViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(sizes[row])"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        shoeSizeTextField.text = "\(sizes[row])"
    }
}

extension UserDataViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        if textField.isEqual(emailTextField) {
            if isValidEmailAddress(emailAddressString: textField.text ?? "") {
                confirmValidEmail()
            } else {
                warnInvalidEmail()
                emailTextField.text = ""
            }
        }
        return true
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if textField.isEqual(phoneTextField) {
            let fullString = (textField.text ?? "") + string

            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
            return false
        }
        return true
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
