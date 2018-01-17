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
    return newAchievementSubject.asDriver(onErrorDriveWith: Driver.empty())
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
    let isValidThresholdText = { (text: String?) -> Bool in
      return UInt(text ?? "") != nil
    }
    
    let validators: [Observable<Bool>] = [
      titleTextField.rx.text.map { $0?.isNotEmpty ?? false },  // TODO: Validate no duplication
      copperThresholdTextField.rx.text.map(isValidThresholdText), // TODO: Validate threshold order
      silverThresholdTextField.rx.text.map(isValidThresholdText),
      goldThresholdTextField.rx.text.map(isValidThresholdText),
      platinumThresholdTextField.rx.text.map(isValidThresholdText),
      onyxThresholdTextField.rx.text.map(isValidThresholdText),
    ]
    
    Observable<Bool>
      .combineLatest(validators) { validationResults -> Bool in
        let isInvalid = validationResults.contains { $0 == false }
        return isInvalid == false
      }
      .asDriver(onErrorDriveWith: Driver.just(false))
      .drive(doneButton.rx.isEnabled)
      .disposed(by: disposeBag)

    let doneButtonTap = doneButton.rx.tap.asDriver()
      .map { [weak self] _ -> Achievement? in
        guard
          let title = self?.titleTextField.text
        else {
            return nil
        }
        return Achievement.init(title: title, events: [])
      }
      .filterNil()
      
    doneButtonTap
      .drive(newAchievementSubject)
      .disposed(by: disposeBag)
    
    doneButtonTap
      .map { _ in }
      .drive(self.rx.dismiss)
      .disposed(by: disposeBag)
  }
}

extension NewAchievementViewController: IBInstantiatable {
  struct Dependency {
  }

  func inject(dependency: NewAchievementViewController.Dependency) {
  }
}
