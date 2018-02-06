//
//  NewProgressViewController.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/24.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

final class NewProgressViewController: UITableViewController {
  
  @IBOutlet private weak var doneButton: UIBarButtonItem!
  @IBOutlet private weak var descriptionTextField: UITextField!

  let disposeBag = DisposeBag.init()

  private var achievement: Achievement!
  
  private let newEventSubject = PublishSubject<Event>.init()
  var newEventDriver: Driver<Event> {
    return newEventSubject.asDriver(onErrorDriveWith: Driver.empty())
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let doneButtonTap = doneButton.rx.tap.asDriver()
      .map { [weak self] _ -> Event in
        return Event.init(description: self?.descriptionTextField.text)
      }

    doneButtonTap
      .drive(newEventSubject)
      .disposed(by: disposeBag)
    
    doneButtonTap
      .map { _ in }
      .drive(self.rx.dismiss)
      .disposed(by: disposeBag)
    
    descriptionTextField.becomeFirstResponder()
  }
}

extension NewProgressViewController: IBInstantiatable {
  struct Dependency {
    let achievement: Achievement
  }
  
  func inject(dependency: Dependency) {
    achievement = dependency.achievement
  }
}
