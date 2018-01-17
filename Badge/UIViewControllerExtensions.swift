//
//  UIViewControllerExtensions.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/10.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIViewController {
  @IBAction func dismiss(sender: AnyObject) {
    dismiss(animated: true, completion: nil)
  }
}

extension Reactive where Base: UIViewController {
  var dismiss: Binder<Void> {
    return Binder(self.base) { viewController, _ in
      viewController.dismiss(animated: true, completion: nil)
    }
  }
}
