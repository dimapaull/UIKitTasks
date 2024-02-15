// UIButton+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Расширение позволяющее убрать все старые вью с кнопки перед изменением дизайна
extension UIButton {
    func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
