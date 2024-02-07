// GuessNumber.swift
// Copyright © RoadMap. All rights reserved.

/// Guess Number struct
struct GuessNumber {
    enum ResultState {
        case right
        case fail
        case less
        case more
    }

    let conceivedNumber = Int.random(in: 1 ... 10)

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
