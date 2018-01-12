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
import RxOptional

final class NewAchievementViewController: UITableViewController {
  
  @IBOutlet private weak var titleTextField: UITextField!
  @IBOutlet private weak var copperThresholdTextField: UITextField!
  @IBOutlet private weak var silverThresholdTextField: UITextField!
  @IBOutlet private weak var goldThresholdTextField: UITextField!
  @IBOutlet private weak var platinumThresholdTextField: UITextField!
  @IBOutlet private weak var onyxThresholdTextField: UITextField!
  @IBOutlet private weak var doneButton: UIBarButtonItem!

  let disposeBag = DisposeBag.init()
  
  private let newAchievementSubject = PublishSubject<Achievement>.init()
  var newAchievementDriver: Driver<Achievement> {
    return newAchievementSubject
      .asDriver(onErrorRecover: { _ -> SharedSequence<DriverSharingStrategy, Achievement> in
        fatalError("Logic Failure") // https://github.com/apple/swift/blob/master/docs/ErrorHandlingRationale.rst#logic-failures
      })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    let validators: [Observable<Bool>] = [
      titleTextField.rx.text.map { $0?.isEmpty ?? false }
    ]
    Observable<Bool>
      .combineLatest(validators) { validationResults -> Bool in
        let isInvalid = validationResults.contains { $0 == false }
        return isInvalid == false
      }
      .asDriver { _ -> SharedSequence<DriverSharingStrategy, Bool> in
        return Driver.just(false)
      }
      .drive(doneButton.rx.isEnabled)
      .disposed(by: disposeBag)

    doneButton.rx.tap.asDriver()
      .map { [weak self] _ -> Achievement? in
        guard
          let title = self?.titleTextField.text
        else {
            return nil
        }
        return Achievement.init(title: title, events: [])
      }
      .filterNil()
      .drive(newAchievementSubject)
      .disposed(by: disposeBag)
  }
}

extension NewAchievementViewController: IBInstantiatable {
  struct Dependency {
  }

  func inject(dependency: NewAchievementViewController.Dependency) {
  }
}
