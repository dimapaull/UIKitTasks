// Stories.swift
// Copyright © RoadMap. All rights reserved.

/// Описывает структуру для истории
struct Stories {
    /// Имя пользователя в истории
    var userName: String
    /// Название изображения с аватаром пользователя
    var imageName: String
    /// Указывает принадлежит ли история пользователю, который сейчас залогинен
    var isSelfStory = false

//    init(userName: String, imageName: String) {
//        self.userName = userName
//        self.imageName = imageName
//    }
}
