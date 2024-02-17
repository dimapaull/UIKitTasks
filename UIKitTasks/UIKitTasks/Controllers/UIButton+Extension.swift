// UIButton+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

import UIKit

/// Расширение для добавления горизонтальной линии
extension UIButton {
    /// Добаляет горизонтальную линию
    func addLine() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(
            x: 0,
            y: frame.size.height - width,
            width: frame.size.width,
            height: frame.size.height
        )
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
