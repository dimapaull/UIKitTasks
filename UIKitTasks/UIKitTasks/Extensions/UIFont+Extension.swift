// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширения для использования новых шрифтов
extension UIFont {
    /// Возвращает шрифт Verdana
    func verdana(ofSize: CGFloat) -> UIFont {
        UIFont(name: "Verdana", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }

    /// Возвращает шрифт VerdanaBold
    func verdanaBold(ofSize: CGFloat) -> UIFont {
        UIFont(name: "Verdana-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
}
