// Stories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описывает структуру для истории
struct Stories {
    /// Имя пользователя в истории
    var userName: String
    /// Аватар пользователя
    var image: String
    /// Указывает принадлежит ли история пользователю, который сейчас залогинен
    let isSelfStory: Bool
}
