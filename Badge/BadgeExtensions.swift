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
