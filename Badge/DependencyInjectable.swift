//
//  DependencyInjectable.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/10.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import Foundation

internal protocol DependencyInjectable {
  associatedtype Dependency
  static func instantiate(with dependency: Dependency) -> Self
}
