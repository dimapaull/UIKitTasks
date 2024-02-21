// UILabel+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширения для добавления аттрибутов в текст
extension UILabel {
    func setupLabelAttribute(fontSize: CGFloat, name: String, title: String, time: String?) {
        let attributedString = NSMutableAttributedString()
        attributedString.append(NSAttributedString(
            string: name,
            attributes: [NSAttributedString.Key.font: UIFont().verdanaBold(ofSize: fontSize)]
        ))
        attributedString.append(NSAttributedString(
            string: title,
            attributes: [NSAttributedString.Key.font: UIFont().verdana(ofSize: fontSize)]
        ))
        attributedString.append(NSAttributedString(
            string: time ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.appGray,
                NSAttributedString.Key.font: UIFont().verdana(ofSize: fontSize)
            ]
        ))
        attributedText = attributedString
    }
}
