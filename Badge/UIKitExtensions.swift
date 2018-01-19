//
//  UIKitExtensions.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/19.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(decimalRed: Int, green: Int, blue: Int, alpha: CGFloat) {
    self.init(red: CGFloat(decimalRed) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
  }
}
