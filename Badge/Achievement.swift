//
//  Achievement.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/09.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import Foundation

struct Achievement: Codable {
  let title: String
  var events: [Event]
  let copperThreshold: UInt
  let silverThreshold: UInt
  let goldThreshold: UInt
  let platinumThreshold: UInt
  let onyxThreshold: UInt

  var progress: UInt {
    return UInt(events.count)
  }
}
