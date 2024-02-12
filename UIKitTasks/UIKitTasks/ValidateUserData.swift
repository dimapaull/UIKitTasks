// ValidateUserData.swift
// Copyright © RoadMap. All rights reserved.

protocol DataValidable: AnyObject {
    func dataValidChangeTo(_ isConform: Bool)
}

import Foundation

/// Проверяет данны пользователя на корректность
final class ValidateUserData {
    // MARK: - Public Properties

    /// Логин пользователя. Проверка на корректность при изменении
    var mail: String? {
        didSet {
            if let safeMail = mail, safeMail.contains("@") {
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
            if password?.count ?? 0 > 8 {
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
