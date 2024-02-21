// Stories.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описывает структуру для истории
struct Stories {
    /// Имя пользователя в истории
    var userName: String
    /// Название изображения с аватаром пользователя
    var imageName: String
    /// Указывает принадлежит ли история пользователю, который сейчас залогинен
    let isSelfStory: Bool
}
