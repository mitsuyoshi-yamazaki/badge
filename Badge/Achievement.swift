//
//  Achievement.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/09.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit

struct Achievement: Codable {
  
  let title: String
  var events: [Event]
  let copperThreshold: UInt
  let silverThreshold: UInt
  let goldThreshold: UInt
  let platinumThreshold: UInt
  let onyxThreshold: UInt
}

extension Achievement {
  enum Medal {
    case unstarted
    case copper
    case silver
    case gold
    case platinum
    case onyx
  }

  var progress: UInt {
    return UInt(events.count)
  }
  
  var medal: Medal {
    switch progress {
    case 0..<copperThreshold:
      return .unstarted
      
    case copperThreshold..<silverThreshold:
      return .copper
      
    case silverThreshold..<goldThreshold:
      return .silver
      
    case goldThreshold..<platinumThreshold:
      return .gold
      
    case platinumThreshold..<onyxThreshold:
      return .platinum
      
    case onyxThreshold..<UInt.max:
      return .onyx
      
    default:
      fatalError("Logic failure")
    }
  }
}

extension Achievement.Medal {
  var color: UIColor {
    switch self {
    case .unstarted:
      return UIColor.badge.unstarted

    case .copper:
      return UIColor.badge.copper

    case .silver:
      return UIColor.badge.silver

    case .gold:
      return UIColor.badge.gold

    case .platinum:
      return UIColor.badge.platinum
      
    case .onyx:
      return UIColor.badge.onyx
    }
  }
  
  var lightColor: UIColor {
    switch self {
    case .unstarted:
      return UIColor.badge.lightUnstarted
      
    case .copper:
      return UIColor.badge.lightCopper
      
    case .silver:
      return UIColor.badge.lightSilver
      
    case .gold:
      return UIColor.badge.lightGold
      
    case .platinum:
      return UIColor.badge.lightPlatinum
      
    case .onyx:
      return UIColor.badge.lightOnyx
    }
  }
}
