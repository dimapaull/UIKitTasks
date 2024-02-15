// ValidateUserData.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Валидация введенных данных пользователя
protocol DataValidable: AnyObject {
    /// Метод, возвращающий булевое значение, указывающее на валидность логина и пароля
    func dataValidChangeTo(_ isConform: Bool)
}

/// Проверяет данны пользователя на корректность
final class ValidateUserData {
    // MARK: - Constants

    private enum Constants {
        static let minimumSymbols = 8
        static let needSymbol = "@"
    }

    // MARK: - Public Properties

    /// Логин пользователя. Проверка на корректность при изменении
    var mail: String? {
        didSet {
            if let safeMail = mail, safeMail.contains(Constants.needSymbol) {
                isMailValid = true
            } else {
                isMailValid = false
            }
            delegate?.dataValidChangeTo(isLogInPossible)
        }
    }

    /// Пароль пользователя. Проверка на корректность при изменении
    var password: String? {
        didSet {
            if password?.count ?? 0 > Constants.minimumSymbols {
                isPasswordValid = true
            } else {
                isPasswordValid = false
            }
            delegate?.dataValidChangeTo(isLogInPossible)
        }
    }

    weak var delegate: DataValidable?

    // MARK: - Private Properties

    private var isMailValid = false
    private var isPasswordValid = false
    private var isLogInPossible: Bool {
        isMailValid && isPasswordValid
    }
}
