//
//  LHColor.swift
//  LHHub
//
//  Created by laohanme on 05/05/2020.
//  Copyright © 2020 laohanme. All rights reserved.
//

import UIKit

// MARK: Extension UIColor HEX code
/// This extension is use for support color hex code
public extension UIColor {
    convenience init(hex: String) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat? = 1.0) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a!)
    }
}
