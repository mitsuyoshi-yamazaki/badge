//
//  IBInstantiatable.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/10.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit

protocol IBInstantiatable: DependencyInjectable {
}

extension IBInstantiatable where Self: UIViewController {
  static func instantiate(with dependency: Dependency) -> Self {
    let className = String.init(describing: self)
    let storyboard = UIStoryboard.init(name: className, bundle: nil)
    
    return storyboard.instantiateInitialViewController() as! Self
  }
}
