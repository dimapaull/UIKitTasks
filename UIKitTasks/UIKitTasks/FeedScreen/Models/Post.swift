// Post.swift
// Copyright © RoadMap. All rights reserved.

/// Описывает структуру поста
struct Post {
    /// Имя владельца поста
    let userName: String
    /// Автар владельца поста
    let userAvatarImageName: String
    /// Названия/название картинок поста
    let postImageNames: [String]
    /// Суммарное количество лайков
    let likes: Int
    /// Подпись поста
    let postTitle: String
    /// Изображение залогиненного пользователя для комментария
    let loginUserAvatarImageName: String
}
