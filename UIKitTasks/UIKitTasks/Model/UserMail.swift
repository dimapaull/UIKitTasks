// UserMail.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Синглтон, который записывает почту во входном контроллере
class UserMail {
    static let shared = UserMail()

    var mail = ""

    init(mail: String = "") {
        self.mail = mail
    }
}
