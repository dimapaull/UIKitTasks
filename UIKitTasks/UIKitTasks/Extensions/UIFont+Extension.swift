// UIFont+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIFont {
    func verdana(ofSize: CGFloat) -> UIFont {
        UIFont(name: "Verdana", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }

    func verdanaBold(ofSize: CGFloat) -> UIFont {
        UIFont(name: "Verdana-Bold", size: ofSize) ?? UIFont.systemFont(ofSize: ofSize)
    }
}
