// Track.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Описание трека
struct Track {
    var name: String = ""
    var artist: String = ""
    var length: String = ""
}

/// Набор из песен
class PlayList {
    static let track1 = Track(
        name: "Let It Be",
        artist: "The Beatles",
        length: "04:03"
    )
    static let track2 = Track(
        name: "Yesterday",
        artist: "The Beatles",
        length: "02:05"
    )
    static let track3 = Track(
        name: "The Show Must Go On",
        artist: "Queen",
        length: "04:31"
    )
}
