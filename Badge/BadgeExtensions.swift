//
//  BadgeExtensions.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/18.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit

struct BadgeExtension<Base> {
  let base: Base
  
  init(_ base: Base) {
    self.base = base
  }
}

protocol BadgeExtensionCompatible {
  associatedtype Compatible
  static var badge: BadgeExtension<Compatible>.Type { get }
  var badge: BadgeExtension<Compatible> { get }
}

extension BadgeExtensionCompatible {
  static var badge: BadgeExtension<Self>.Type {
    return BadgeExtension<Self>.self
  }
  var badge: BadgeExtension<Self> {
    return BadgeExtension(self)
  }
}

extension UIColor: BadgeExtensionCompatible {}
extension BadgeExtension where Base: UIColor {
  static var lightUnstarted: UIColor {
    return UIColor.init(white: 0.8, alpha: 1.0)
  }
  
  static var lightCopper: UIColor {
    return UIColor(decimalRed: 208, green: 143, blue: 111, alpha: 1.0)
  }
  
  static var lightSilver: UIColor {
    return UIColor(decimalRed: 153, green: 176, blue: 182, alpha: 1.0)
  }
  
  static var lightGold: UIColor {
    return UIColor(decimalRed: 251, green: 212, blue: 137, alpha: 1.0)
  }

  static var lightPlatinum: UIColor {
    return UIColor.white
  }

  static var lightOnyx: UIColor {
    return UIColor.black
  }

  static var unstarted: UIColor {
    return UIColor.init(white: 0.5, alpha: 1.0)
  }

  static var copper: UIColor {
    return UIColor(decimalRed: 74, green: 32, blue: 12, alpha: 1.0)
  }
  
  static var silver: UIColor {
    return UIColor(decimalRed: 58, green: 66, blue: 67, alpha: 1.0)
  }
  
  static var gold: UIColor {
    return UIColor(decimalRed: 107, green: 77, blue: 39, alpha: 1.0)
  }
  
  static var platinum: UIColor {
    return UIColor.white
  }
  
  static var onyx: UIColor {
    return UIColor.black
  }
}
