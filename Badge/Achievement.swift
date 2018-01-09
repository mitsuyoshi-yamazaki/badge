//
//  Achievement.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/09.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import Foundation

struct Achievement {
  let title: String
  var events: [Event]
  
  var progress: Int {
    return events.count
  }
}

extension Achievement {
  static func loadFixture() -> [Achievement] {
    
    let emptyEvent = Event.init(description: nil)
    
    func createFixture(with title: String, progress: Int) -> Achievement {
      return Achievement.init(title: title, events: (0..<progress).map { _ in emptyEvent })
    }
    
    return [
      createFixture(with: "読書", progress: 10),
      createFixture(with: "アプリ", progress: 2),
      createFixture(with: "LT", progress: 1),
      createFixture(with: "筋トレ", progress: 20),
    ]
  }
}
