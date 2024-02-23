// Notification.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описывает структуру уведомления
struct Notification {
    /// Имя пользователя, который отправил уведомление
    let userName: String
    /// Текст уведомления
    let titleNotification: String
    /// Название изображения пользователя отправившего уведомление
    let avatarUserImageName: String
    /// Время отправки уведомления
    let timeNotification: String
    /// Название изображения с которым было связано уведомление
    let postImageName: String?
    /// Указывает на то, если уведомление было с упоминанием пользователя
    let isMention: Bool

    /// Указывает на то, если уведомление было связано с публикацией
    var isPostNotification: Bool {
        postImageName == nil
    }
}
