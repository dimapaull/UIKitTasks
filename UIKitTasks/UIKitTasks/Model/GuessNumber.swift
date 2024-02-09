// GuessNumber.swift
// Copyright © RoadMap. All rights reserved.

/// Модель, обрабатывающая ответы пользователя
struct GuessNumber {
    /// Описывает различные состояния в зависимости от того, что ввел пользователь
    enum ResultState {
        case right
        case fail
        case less
        case more
    }

    // MARK: - Constants

    private let conceivedNumber = Int.random(in: 1 ... 10)

    // MARK: - Public Methods

    func checkNumber(_ number: Int) -> ResultState {
        var state = ResultState.fail

        switch number {
        case conceivedNumber:
            state = .right
        case _ where number < conceivedNumber:
            state = .less
        case _ where number > conceivedNumber:
            state = .more
        default:
            state = .fail
        }

        return state
    }
}
