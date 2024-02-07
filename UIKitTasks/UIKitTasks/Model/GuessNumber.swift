// GuessNumber.swift
// Copyright © RoadMap. All rights reserved.

/// Guess Number struct
struct GuessNumber {
    var conceivedNumber: Int {
        Int.random(in: 1 ... 10)
    }

    func checkNumber(_ number: Int) -> Bool {
        number == conceivedNumber ? true : false
    }
}
