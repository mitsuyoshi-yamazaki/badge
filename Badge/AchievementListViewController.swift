//
//  AchievementListViewController.swift
//  Badge
//
//  Created by mitsuyoshi.yamazaki on 2018/01/09.
//  Copyright © 2018年 Mitsuyoshi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class AchievementCell: UICollectionViewCell {
  @IBOutlet fileprivate weak var titleLabel: UILabel!
}

final class AchievementListViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var addButton: UIBarButtonItem!

  private var achievements: [Achievement] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadMedals()
    
    addButton.rx.tap.asDriver()
      .drive(onNext: { [weak self] _ in
        let newAchievementViewController = NewAchievementViewController.instantiate(with: .init())
        let navigationController = UINavigationController.init(rootViewController: newAchievementViewController)
        
        self?.present(navigationController, animated: true, completion: nil)
      })
      .disposed(by: disposeBag)
  }
}

private extension AchievementListViewController {
  func loadMedals() {
    
    achievements = Achievement.loadFixture()
  }
}

extension AchievementListViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return achievements.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCell", for: indexPath) as! AchievementCell
    let achievement = achievements[indexPath.item]
    
    cell.titleLabel.text = "\(achievement.title)\n(\(achievement.progress))"
    
    return cell
  }
}

extension AchievementListViewController: UICollectionViewDelegate {
}
