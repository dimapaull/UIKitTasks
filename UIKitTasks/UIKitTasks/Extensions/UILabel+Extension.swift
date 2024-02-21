// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение позволяющее работать с атрибутами
extension UILabel {
    /// Метод добавляющий аттрибуты для label
    /// - Parameter fontSize: Размер необходимого атрибута
    /// - Parameter title: Текст заголовка
    /// - Parameter descripton: Основной текст
    /// - Parameter additionalText: Дополнительный текст
    func setupLabelAttribute(fontSize: CGFloat, title: String, descripton: String, additionalText: String?) {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.font: UIFont().verdanaBold(ofSize: fontSize)]
        ))
        attributedString.append(NSAttributedString(
            string: descripton,
            attributes: [NSAttributedString.Key.font: UIFont().verdana(ofSize: fontSize)]
        ))
        attributedString.append(NSAttributedString(
            string: additionalText ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.appGray,
                NSAttributedString.Key.font: UIFont().verdana(ofSize: fontSize)
            ]
        ))
        attributedText = attributedString
    }
}
