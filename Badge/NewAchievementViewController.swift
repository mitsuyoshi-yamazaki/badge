//
//  NewAchievementViewController.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/10.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class NewAchievementViewController: UITableViewController {
  
  @IBOutlet private weak var titleTextField: UITextField!
  @IBOutlet private weak var copperThresholdTextField: UITextField!
  @IBOutlet private weak var silverThresholdTextField: UITextField!
  @IBOutlet private weak var goldThresholdTextField: UITextField!
  @IBOutlet private weak var platinumThresholdTextField: UITextField!
  @IBOutlet private weak var onyxThresholdTextField: UITextField!
  @IBOutlet private weak var doneButton: UIBarButtonItem!

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

extension NewAchievementViewController: IBInstantiatable {
  struct Dependency {
  }

  func inject(dependency: NewAchievementViewController.Dependency) {
  }
}
