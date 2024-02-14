// UIButton+Extension.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

extension UIButton {
    func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
