// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение, добавляющее новые возможности работы с ее тенью
extension UIView {
    /// Метод добавляющий горизонтальную тень
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowPath = UIBezierPath(rect: CGRect(
            x: 0,
            y: bounds.maxY - layer.shadowRadius,
            width: bounds.width,
            height: layer.shadowRadius
        )).cgPath
    }
}
